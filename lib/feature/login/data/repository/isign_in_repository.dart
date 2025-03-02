import '../dto/request/sign_in_request.dart';
import '../dto/response/sign_in_response.dart';

abstract interface class ISignInRepository {
  Future<SignInResponse> signIn(SignInRequest signInRequest);
}