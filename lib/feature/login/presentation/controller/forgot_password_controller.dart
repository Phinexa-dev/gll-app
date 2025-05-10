import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/login/application/forgot_password_service.dart';
import 'package:gll/feature/login/presentation/state/forgot_password_state.dart';

final forgotPasswordControllerProvider =
    AutoDisposeNotifierProvider<ForgotPasswordController, ForgotPasswordState>(
        ForgotPasswordController.new);

class ForgotPasswordController
    extends AutoDisposeNotifier<ForgotPasswordState> {
  @override
  ForgotPasswordState build() {
    return ForgotPasswordState();
  }

  Future<void> forgotPassword(String email) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
        email: email,
      );

      await ref.read(forgotPasswordServiceProvider).forgotPassword(email);

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage ?? 'An error occurred',
      );
    }
  }
}
