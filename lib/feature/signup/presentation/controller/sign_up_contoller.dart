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
      // TODO : integrate with backend verification
      // await ref.read(signUpRepositoryProvider).sendVerificationCode(payload);

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

    try {
      final payload = {'email': email};
      // TODO : integrate with backend verification
      // await ref.read(signUpRepositoryProvider).sendVerificationCode(payload);
      // restart cooldown on success
      state = state.copyWith(
          resendCooldownSeconds: 60, isFailure: null, errorMessage: null);
      _startResendCountdown();
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] as String?;
      state = state.copyWith(
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
      // TODO : integrate with backend verification
      final verified = (DateTime.now().millisecondsSinceEpoch % 2 == 0);
      // final verified = await ref.read(signUpRepositoryProvider).verifyCode(verifyPayload);

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
    // Validate phone number length
    bool isPhoneNumberValid = true;
    String? errorMessage;

    switch (dialCode) {
      case '+1': // USA
        if (phoneNumber.length != 10) {
          isPhoneNumberValid = false;
          errorMessage = 'US phone numbers must be 10 digits';
        }
        break;
      case '+91': // India
        if (phoneNumber.length != 10) {
          isPhoneNumberValid = false;
          errorMessage = 'Indian phone numbers must be 10 digits';
        }
        break;
      case '+94': // Sri Lanka
        if (phoneNumber.length != 9) {
          isPhoneNumberValid = false;
          errorMessage = 'Sri Lankan phone numbers must be 9 digits';
        }
        break;
      case '+355': // Albania
        if (phoneNumber.length != 9 && phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage =
              'Albanian phone numbers must be 9 (mobile) or 8 (landline) digits';
        }
        break;
      case '+381': // Serbia
        if (phoneNumber.length != 9 &&
            phoneNumber.length != 7 &&
            phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage =
              'Serbian phone numbers must be 9 (mobile) or 7–8 (landline) digits';
        }
        break;
      case '+382': // Montenegro
        if (phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage = 'Montenegrin phone numbers must be 8 digits';
        }
        break;
      case '+383': // Kosovo
        if (phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage = 'Kosovo phone numbers must be 8 digits';
        }
        break;
      case '+385': // Croatia
        if (phoneNumber.length != 9 && phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage =
              'Croatian phone numbers must be 9 (mobile) or 8–9 (landline) digits';
        }
        break;
      case '+386': // Slovenia
        if (phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage = 'Slovenian phone numbers must be 8 digits';
        }
        break;
      case '+387': // Bosnia and Herzegovina
        if (phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage = 'Bosnian phone numbers must be 8 digits';
        }
        break;
      case '+359': // Bulgaria
        if (phoneNumber.length != 9 &&
            phoneNumber.length != 7 &&
            phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage =
              'Bulgarian phone numbers must be 9 (mobile) or 7–8 (landline) digits';
        }
        break;
      case '+389': // North Macedonia
        if (phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage = 'Macedonian phone numbers must be 8 digits';
        }
        break;
      case '+977': // Nepal
        if (phoneNumber.length != 10 && phoneNumber.length != 8) {
          isPhoneNumberValid = false;
          errorMessage =
              'Nepalese phone numbers must be 10 (mobile) or 8 (landline) digits';
        }
        break;
      default:
        isPhoneNumberValid = false;
        errorMessage = 'Unsupported country code';
    }

    if (!isPhoneNumberValid) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: errorMessage,
      );
    }

    return isPhoneNumberValid;
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(signUpForm: formData);
  }
}
