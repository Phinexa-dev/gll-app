import '../dto/request/sign_in_request.dart';

abstract interface class ISignInRepository {
  Future<void> signIn(SignInRequest signInRequest);
}