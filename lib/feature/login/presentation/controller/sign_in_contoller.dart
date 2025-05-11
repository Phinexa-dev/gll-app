import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/login/application/sign_in_service.dart';
import 'package:gll/feature/login/presentation/state/sign_in_state.dart';

import '../../../../core/data/local/auth/auth_notifier.dart';
import '../../../../core/data/remote/network_service.dart';
import '../../../../core/presentation/provider/user_notifier_provider.dart';
import '../../data/dto/request/sign_in_request.dart';

final signInControllerProvider =
    AutoDisposeNotifierProvider<SignInController, SignInState>(
        SignInController.new);

class SignInController extends AutoDisposeNotifier<SignInState> {
  @override
  SignInState build() {
    return SignInState();
  }

  void clearStates() {
    state = state.copyWith(
      errorMessage: null,
      isSuccess: null,
      isFailure: null,
      isLoading: false,
    );
  }

  Future<void> signIn() async {
    final email = state.signInForm?['email'];
    final password = state.signInForm?['password'];

    if (email.isEmpty || password.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all the fields',
      );
      return;
    }

    // validate email
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please enter a valid email address',
      );
      return;
    }

    try {
      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final signInRequest = SignInRequest(
        email: email,
        password: password,
      );

      final result =
          await ref.read(signInServiceProvider).signIn(signInRequest);

      // notify the router
      final dio = ref.watch(networkServiceProvider);
      final authNotifier = ref.read(routerNotifierProvider(dio));
      await authNotifier.updateAuthState();
      // load user data
      ref.read(userNotifierProvider.notifier).loadUser();
      state = state.copyWith(
        isLoading: false,
        isSuccess: result.success,
        isFailure: !result.success,
      );
    } on DioException catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        // errorMessage: e.response?.statusMessage ?? 'An error occurred',
        errorMessage: null,
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      signInForm: formData,
    );
  }
}
