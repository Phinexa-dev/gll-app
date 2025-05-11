import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/http_status/status_code.dart';
import 'package:gll/core/data/remote/token/itoken_service.dart';
import 'package:gll/core/data/remote/token/token_service.dart';

import '../../../feature/bottom_bar/presentation/ui/provider/nav_provider.dart';
import '../../../feature/system_feedback/provider/feedback_provider.dart';
import '../../../feature/system_feedback/service/feedback_service.dart';
import '../local/auth/auth_notifier.dart';
import '../local/user/iuser_service.dart';
import '../local/user/user_service.dart';

final networkServiceInterceptorProvider = Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
  final tokenService = ref.watch(tokenServiceProvider(dio));
  final userService = ref.read(userServiceProvider(dio));
  final authNotifier = ref.read(routerNotifierProvider(dio));
  final feedbackService = ref.read(feedbackServiceProvider);

  onTokenExpired() {
    ref.read(navProvider.notifier).onItemTapped(0);
  }

  return NetworkServiceInterceptor(
      tokenService,
      dio,
      userService,
      authNotifier,
      feedbackService,
      onTokenExpired: onTokenExpired,
  );
});

final class NetworkServiceInterceptor extends Interceptor {

  final ITokenService _tokenService;
  final Dio _dio;
  final IUserService _userService;
  final RouterNotifier _authNotifier;
  final FeedbackService _feedbackService;
  final void Function()? onTokenExpired;

  NetworkServiceInterceptor(
        this._tokenService,
        this._dio,
        this._userService,
        this._authNotifier,
        this._feedbackService,{
        this.onTokenExpired,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _tokenService.getAccessToken();

    options.headers['Content-type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Authorization'] = 'Bearer $accessToken';

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // handle unauthorized error
    if (err.response?.statusCode == unauthorized) {
      final token = await _tokenService.getRefreshToken();

      try {
        final result = await _tokenService.refreshToken(token);

        final accessToken = result.data.accessToken;
        final refreshToken = result.data.refreshToken;

        // save the new access token and refresh token
        await _tokenService.saveTokens(accessToken, refreshToken);

        final options = err.requestOptions;
        // update the request headers with new access token
        options.headers['Authorization'] = 'Bearer $accessToken';

        // repeat the request with the updated access token
        return handler.resolve(await _dio.fetch(options));
      }
      on DioException catch (e) {
        if  (e.response?.statusCode == refreshTokenExpired) {
          // delete the access token and refresh token from secure storage
          await _tokenService.clearTokens();

          return handler.next(err);
        }

        // TODO: temporary solution
        // TODO: Handle logout here since the refresh token mechanism is not provided from the backend
        await _userService.clearUser();
        await _tokenService.clearTokens();
        // notify the router
        await _authNotifier.updateAuthState();
        // ref.read(navProvider.notifier).onItemTapped(0);
        onTokenExpired?.call();
        _feedbackService.showToast("Token expired, please login again");

        //continue with the error
        return handler.next(err);
      }
    }
    // continue with the error
    return handler.next(err);
  }
}