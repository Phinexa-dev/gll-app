import 'package:gll/feature/login/data/dto/request/forgot_password_request.dart';

abstract interface class IForgotPasswordRepository {
  Future<void> forgotPassword(ForgotPasswordRequest request);
} 