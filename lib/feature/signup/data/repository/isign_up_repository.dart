import '../dto/request/sign_up_request.dart';
import '../dto/response/sign_up_response.dart';

abstract interface class ISignUpRepository {
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest);

  Future<void> sendVerificationCode(Map<String, dynamic> payload);

  Future<bool> verifyCode(Map<String, dynamic> payload);
}
