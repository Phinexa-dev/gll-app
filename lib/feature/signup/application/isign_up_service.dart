import '../data/dto/request/sign_up_request.dart';

abstract interface class ISignUpService {
  Future<bool> signUp(SignUpRequest signUpRequest);
}