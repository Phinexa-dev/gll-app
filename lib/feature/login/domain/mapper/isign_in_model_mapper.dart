import 'package:gll/feature/login/data/dto/response/sign_in_response.dart';
import 'package:gll/feature/login/domain/model/sign_in_model.dart';

abstract interface class ISignInModelMapper {
  SignInModel mapToSignUpModel(SignInResponse data);
}