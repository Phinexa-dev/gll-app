import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dto/request/sign_in_request.dart';
import '../dto/response/sign_in_response.dart';
import '../source/remote/signin_api.dart';
import 'isign_in_repository.dart';

final signInRepositoryProvider = Provider<ISignInRepository>((ref) {
  final SignInApi signInApi = ref.watch(signInApiProvider);
  return SignInRepository(signInApi);
});

final class SignInRepository implements ISignInRepository {
  final SignInApi _signInApi;

  SignInRepository(this._signInApi);

  @override
  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    try {

      final response = await _signInApi.signIn(signInRequest);
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }
}