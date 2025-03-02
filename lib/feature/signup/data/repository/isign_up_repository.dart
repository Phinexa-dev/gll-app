import '../dto/request/sign_up_request.dart';

abstract interface class ISignUpRepository {
  Future<void> signUp(SignUpRequest signUpRequest);
}