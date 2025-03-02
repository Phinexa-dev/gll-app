import '../data/dto/request/sign_in_request.dart';
import '../domain/model/sign_in_model.dart';

abstract interface class ISignInService {
  Future<SignInModel> signIn(SignInRequest signInRequest);
}