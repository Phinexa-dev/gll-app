import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/signup/application/sign_up_service.dart';
import 'package:gll/feature/signup/presentation/state/sign_up_state.dart';
import '../../data/dto/request/sign_up_request.dart';
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
    final gender = state.signUpForm?['gender'];

    // --- FIX APPLIED HERE ---
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

    try {
      state = state.copyWith(isLoading: true, isSuccess: null, isFailure: null);

      final signUpRequest = SignUpRequest(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        dialCode: dialCode,
        mobileNumber: phoneNumber,
        gender: gender,
      );

      final result = await ref.read(signUpServiceProvider).signUp(signUpRequest);

      // If signup successful, attempt to sign the user in automatically
      if (result == true) {
        try {
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

          state = state.copyWith(
            isLoading: false,
            isSuccess: signInResult.success,
            isFailure: !signInResult.success,
          );
        } on DioException catch (e) {
          final errorMessage = e.response?.data['message'] as String?;
          state = state.copyWith(
            isLoading: false,
            isSuccess: false,
            isFailure: true,
            errorMessage: errorMessage ?? 'Sign in after signup failed',
          );
        }
      } else {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
        );
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] as String?;
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: errorMessage ?? 'An error occurred',
      );
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
