import '../data/dto/request/sign_in_request.dart';

abstract interface class ISignInService {
  Future<bool> signIn(SignInRequest signInRequest);
}