import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/login/data/dto/request/forgot_password_request.dart';
import 'package:gll/feature/login/data/repository/forgot_password_repository.dart';
import 'package:gll/feature/login/data/repository/iforgot_password_repository.dart';

import 'iforgot_password_service.dart';

final forgotPasswordServiceProvider = Provider<IForgotPasswordService>((ref) {
  final forgotPasswordRepository = ref.watch(forgotPasswordRepositoryProvider);
  return ForgotPasswordService(forgotPasswordRepository);
});

final class ForgotPasswordService implements IForgotPasswordService {
  final IForgotPasswordRepository _forgotPasswordRepository;

  ForgotPasswordService(this._forgotPasswordRepository);

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final request = ForgotPasswordRequest(email: email);
      await _forgotPasswordRepository.forgotPassword(request);
    } on DioException catch (_) {
      rethrow;
    }
  }
} 