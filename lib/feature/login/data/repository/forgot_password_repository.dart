import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/login/data/dto/request/forgot_password_request.dart';
import 'package:gll/feature/login/data/source/remote/forgot_password_api.dart';

import 'iforgot_password_repository.dart';

final forgotPasswordRepositoryProvider = Provider<IForgotPasswordRepository>((ref) {
  final forgotPasswordApi = ref.watch(forgotPasswordApiProvider);
  return ForgotPasswordRepository(forgotPasswordApi);
});

final class ForgotPasswordRepository implements IForgotPasswordRepository {
  final ForgotPasswordApi _forgotPasswordApi;

  ForgotPasswordRepository(this._forgotPasswordApi);

  @override
  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    try {
      await _forgotPasswordApi.forgotPassword(request);
    } on DioException catch (_) {
      rethrow;
    }
  }
} 