import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/local/user/iuser_service.dart';
import 'package:gll/core/data/local/user/model/user_model.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/feature/login/domain/model/sign_in_model.dart';
import '../../../core/data/local/user/user_service.dart';
import '../../../core/data/remote/token/itoken_service.dart';
import '../../../core/data/remote/token/token_service.dart';
import '../data/dto/request/sign_in_request.dart';
import '../data/dto/response/sign_in_response.dart';
import '../data/repository/isign_in_repository.dart';
import '../data/repository/sign_in_repository.dart';
import 'isign_in_service.dart';

final signInServiceProvider = Provider<ISignInService>((ref) {
  final ISignInRepository signInRepository =
      ref.watch(signInRepositoryProvider);
  final dio = ref.watch(networkServiceProvider);
  final tokenService = ref.watch(tokenServiceProvider(dio));
  final userService = ref.watch(userServiceProvider(dio));
  return SignInService(signInRepository, tokenService, userService);
});

final class SignInService implements ISignInService {
  final ISignInRepository _signInRepository;
  final ITokenService _tokenService;
  final IUserService _userService;

  SignInService(this._signInRepository, this._tokenService, this._userService);

  @override
  Future<SignInModel> signIn(SignInRequest signInRequest) async {
    try {
      final response = await _signInRepository.signIn(signInRequest);

      // use storage services to store the token & refresh token
      // TODO: request refresh token handling from the backend
      final localUserModel = UserModel(
        id: response.user.id,
        fullName: response.user.fullName,
        email: response.user.email,
        country: response.user.country, 
      );
      await _userService.saveUser(localUserModel);
      await _tokenService.saveTokens(response.accessToken, "");

      final model = _mapToSignInModel(response);
      return model;
    } on DioException catch (_) {
      rethrow;
    }
  }

  SignInModel _mapToSignInModel(SignInResponse response) {
    return SignInModel(
      id: response.user.id,
      name: response.user.fullName,
      email: response.user.email,
      accessToken: response.accessToken,
      success: true,
    );
  }
}
