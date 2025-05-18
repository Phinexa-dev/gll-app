import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/signup/application/sign_up_service.dart';
import 'package:gll/feature/signup/presentation/state/sign_up_state.dart';
import '../../data/dto/request/sign_up_request.dart';

final signUpControllerProvider = AutoDisposeNotifierProvider<SignUpController, SignUpState>(SignUpController.new);

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
    final country = state.signUpForm?['country'];
    final password = state.signUpForm?['password'];
    final confirmPassword = state.signUpForm?['confirmPassword'];
    final dialCode = state.signUpForm?['dialCode'];
    final phoneNumber = state.signUpForm?['phoneNumber'];


    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phoneNumber.isEmpty ||
        dialCode.isEmpty ||
        country.isEmpty
    ) {
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

    // validate email
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
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
        errorMessage: 'Password must be at least 8 characters long and contain at least one letter and one number',
      );
      return;
    }

    try{

      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final signUpRequest = SignUpRequest(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        dialCode: dialCode,
        mobileNumber: phoneNumber,
        country: country,
      );

      final result = await ref.read(signUpServiceProvider).signUp(signUpRequest);

      state = state.copyWith(
        isLoading: false,
        isSuccess: result,
        isFailure: !result,
      );

    }
    on DioException catch(e){
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        // errorMessage: e.response?.statusMessage?? 'An error occurred',
        errorMessage: null,
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      signUpForm: formData,
    );
  }

}