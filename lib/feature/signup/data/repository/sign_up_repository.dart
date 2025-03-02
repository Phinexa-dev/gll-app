import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dto/request/sign_up_request.dart';
import '../dto/response/sign_up_response.dart';
import '../source/remote/signup_api.dart';
import 'isign_up_repository.dart';

final signUpRepositoryProvider = Provider<ISignUpRepository>((ref) {
  final SignupApi signupApi = ref.watch(signUpApiProvider);
  return SignUpRepository(signupApi);
});

final class SignUpRepository implements ISignUpRepository {
  final SignupApi _signupApi;

  SignUpRepository(this._signupApi);

  @override
  // Future<SignUpRepository> signUp(SignUpRequest signUpRequest) async {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    try {

      final response = await _signupApi.signUp(signUpRequest);
      return response;

    } on DioException catch (_) {
      rethrow;
    }
  }
}