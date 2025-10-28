import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/signup/application/sign_up_service.dart';
import 'package:gll/feature/signup/presentation/state/sign_up_state.dart';
import '../../data/dto/request/sign_up_request.dart';
import '../../data/repository/sign_up_repository.dart';
import 'package:gll/feature/login/application/sign_in_service.dart';
import 'package:gll/feature/login/data/dto/request/sign_in_request.dart';
import 'package:gll/core/data/local/auth/auth_notifier.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/core/presentation/provider/user_notifier_provider.dart';
import 'package:gll/feature/system_feedback/provider/feedback_provider.dart';
import 'package:gll/feature/system_feedback/model/feedback.dart';

final signUpControllerProvider =
    AutoDisposeNotifierProvider<SignUpController, SignUpState>(
  SignUpController.new,
);

class SignUpController extends AutoDisposeNotifier<SignUpState> {
  Timer? _resendTimer;

  @override
  SignUpState build() {
    return SignUpState();
  }

  void clearStates() {
    state = state.copyWith(
      errorMessage: null,
      isSuccess: null,
      isFailure: null,
      isLoading: false,
    );
  }

  Future<void> signUp() async {
    final fullName = state.signUpForm?['fullName'];
    final email = state.signUpForm?['email'];
    final password = state.signUpForm?['password'];
    final confirmPassword = state.signUpForm?['confirmPassword'];
    final dialCode = state.signUpForm?['dialCode'];
    final phoneNumber = state.signUpForm?['phoneNumber'];
    // The `gender` field has been removed from this validation check.
    // An empty string for gender is now considered a valid, optional field.
    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phoneNumber.isEmpty ||
        dialCode.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Please fill all the fields',
      );
      return;
    }

    if (password != confirmPassword) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Password does not match',
      );
      return;
    }

    // Validate phone number
    if (!validatePhoneNo(dialCode, phoneNumber)) {
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

    // Validate password
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage:
            'Password must be at least 8 characters long and contain at least one letter and one number',
      );
      return;
    }

    // Call backend to send verification code
    state =
        state.copyWith(isLoading: true, isFailure: null, errorMessage: null);

    try {
      final payload = {'email': email};
       await ref.read(signUpRepositoryProvider).sendVerificationCode(payload);

      // backend sent code successfully; move to verification stage
      state = state.copyWith(
        isLoading: false,
        stage: 2,
        enteredCode: null,
        resendCooldownSeconds: 60,
      );

      _startResendCountdown();
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] as String?;
      state = state.copyWith(
        isLoading: false,
        isFailure: true,
        errorMessage: errorMessage ?? 'Failed to send verification code',
      );
    }
  }

  void _startResendCountdown() {
    _resendTimer?.cancel();
    state = state.copyWith(resendCooldownSeconds: 60);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final current = state.resendCooldownSeconds;
      if (current <= 1) {
        timer.cancel();
        state = state.copyWith(resendCooldownSeconds: 0);
      } else {
        state = state.copyWith(resendCooldownSeconds: current - 1);
      }
    });
  }

  void setEnteredCode(String code) {
    state = state.copyWith(enteredCode: code);
  }

  Future<void> resendCode() async {
    if (state.resendCooldownSeconds > 0) return; // still cooling down

    final email = state.signUpForm?['email'] as String?;
    if (email == null || email.isEmpty) {
      state = state.copyWith(
          isFailure: true, errorMessage: 'No email available to resend code');
      return;
    }

    // Set loading state immediately to disable button
    state = state.copyWith(isLoading: true, isFailure: null, errorMessage: null);

    try {
      final payload = {'email': email};
      await ref.read(signUpRepositoryProvider).sendVerificationCode(payload);

      state = state.copyWith(
          isLoading: false,
          resendCooldownSeconds: 60,
          isFailure: null,
          errorMessage: null);
      _startResendCountdown();

      // Show success message
      ref.read(feedbackServiceProvider).showToast(
        'Verification code resent successfully',
        type: FeedbackType.success,
      );
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] as String?;
      state = state.copyWith(
        isLoading: false,
        isFailure: true,
        errorMessage: errorMessage ?? 'Failed to resend verification code',
      );
    }
  }

  void cancelVerification() {
    _resendTimer?.cancel();
    state = state.copyWith(
      stage: 1,
      enteredCode: null,
      resendCooldownSeconds: 0,
      isLoading: false,
      isFailure: null,
      errorMessage: null,
    );
  }

  Future<void> verifyAndSignup() async {
    final entered = state.enteredCode ?? '';

    if (entered.isEmpty) {
      state = state.copyWith(
          isFailure: true, errorMessage: 'Enter verification code');
      return;
    }

    // Call backend to verify code
    state =
        state.copyWith(isLoading: true, isFailure: null, errorMessage: null);
    final fullName = state.signUpForm?['fullName'];
    final email = state.signUpForm?['email'];
    final password = state.signUpForm?['password'];
    final confirmPassword = state.signUpForm?['confirmPassword'];
    final dialCode = state.signUpForm?['dialCode'];
    final phoneNumber = state.signUpForm?['phoneNumber'];

    final signUpRequest = SignUpRequest(
      fullName: fullName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      dialCode: dialCode,
      mobileNumber: phoneNumber,
      gender: state.signUpForm?['gender'],
    );

    try {
      final verifyPayload = {'email': email, 'code': entered};
      final verified = await ref.read(signUpRepositoryProvider).verifyCode(verifyPayload);

      if (!verified) {
        state = state.copyWith(
            isLoading: false,
            isFailure: true,
            errorMessage: 'Verification failed');
        return;
      }

      // proceed with signup API call after successful verification
      try {
        final result =
            await ref.read(signUpServiceProvider).signUp(signUpRequest);

        // If signup successful, attempt to sign the user in automatically
        if (result == true) {
          final signInRequest = SignInRequest(
            email: email,
            password: password,
          );

          final signInResult =
              await ref.read(signInServiceProvider).signIn(signInRequest);

          // notify the router and load user data (same as sign-in flow)
          final dio = ref.watch(networkServiceProvider);
          final authNotifier = ref.read(routerNotifierProvider(dio));
          await authNotifier.updateAuthState();
          ref.read(userNotifierProvider.notifier).loadUser();

          _resendTimer?.cancel();

          state = state.copyWith(
            isLoading: false,
            isSuccess: signInResult.success,
            isFailure: !signInResult.success,
          );

          // Show success message after successful registration
          if (signInResult.success) {
            ref.read(feedbackServiceProvider).showToast(
              'Registration successful! Welcome to Global Learning Lab',
              type: FeedbackType.success,
            );
          }
        } else {
          state = state.copyWith(
              isLoading: false, isSuccess: false, isFailure: true);
        }
      } on DioException catch (e) {
        final errorMessage = e.response?.data['message'] as String?;
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
          errorMessage: errorMessage ?? 'An error occurred during signup',
        );
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] as String?;
      state = state.copyWith(
          isLoading: false,
          isFailure: true,
          errorMessage: errorMessage ?? 'Verification failed');
    }
  }

  bool validatePhoneNo(String dialCode, String phoneNumber) {
    // Remove non-digit characters for safety
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Basic validation: ensure it has at least some reasonable length
    if (phoneNumber.length < 5 || phoneNumber.length > 15) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Invalid phone number length',
      );
      return false;
    }

    // Optionally, you can also check if it’s purely numeric
    if (!RegExp(r'^\d+$').hasMatch(phoneNumber)) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Phone number must contain only digits',
      );
      return false;
    }

    // If passed all checks, it’s valid for any country
    return true;
  }



  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(signUpForm: formData);
  }
}
