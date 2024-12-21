import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/http_status/status_code.dart';
import 'package:gll/core/data/local/secure_storage/Isecure_storage.dart';
import 'package:gll/core/data/local/secure_storage/secure_storage_const.dart';
import '../../../common/dtos/refresh_token_response.dart';
import '../local/secure_storage/secure_storage.dart';

final networkServiceInterceptorProvider = Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
  final secureStorage = ref.watch(secureStorageProvider);
  return NetworkServiceInterceptor(secureStorage, dio);
});

final class NetworkServiceInterceptor extends Interceptor {

  final ISecureStorage _secureStorage;
  final Dio _dio;

  NetworkServiceInterceptor(this._secureStorage, this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _secureStorage.read(key: accessTokenKey);

    options.headers['Content-type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Authorization'] = 'Bearer $accessToken';

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // handle unauthorized error
    if (err.response?.statusCode == unauthorized) {
      final token = await _secureStorage.read(key: refreshTokenKey);

      try {
        final response = await _refreshToken(_dio, token);

        final json = response.data;
        final result = RefreshTokenResponse.fromJson(json?? {});

        final statusCode = response.statusCode;
        if (statusCode == success) {
          final accessToken = result.data.accessToken;
          final refreshToken = result.data.refreshToken;
          
          // save the new access token and refresh token
          await _setAuthData(accessToken, refreshToken);

          final options = err.requestOptions;
          // update the request headers with new access token
          options.headers['Authorization'] = 'Bearer $accessToken';

          // repeat the request with the updated access token
          return handler.resolve(await _dio.fetch(options));
        }
      }
      on DioException catch (e) {
        if  (e.response?.statusCode == refreshTokenExpired) {
          // delete the access token and refresh token from secure storage
          await _clearAuthData();

          // set the status code to 498 to indicate that the token is invalid
          err.response?.statusCode = refreshTokenExpired;

          return handler.next(err);
        }

        //continue with the error
        return handler.next(err);
      }
    }

    // continue with the error
    return handler.next(err);
  }

  Future<void> _clearAuthData() async {
    await _secureStorage.delete(key: accessTokenKey);
    await _secureStorage.delete(key: refreshTokenKey);
  }

  Future<void> _setAuthData(String accessToken, String refreshToken) async {
    await _secureStorage.write(key: accessTokenKey, value: accessToken);
    await _secureStorage.write(key: refreshTokenKey, value: refreshToken);
  }

  Future<Response<Map<String, dynamic>>> _refreshToken(Dio dio, String? token) async {
    return await _dio.post<Map<String, dynamic>>(
      '/refresh_token',
      data: {
        'refreshToken': token,
      },
    );
  }
}