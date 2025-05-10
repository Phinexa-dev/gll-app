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
        errorMessage: e.response?.statusMessage?? 'An error occurred',
      );
    }
  }

  void setFormData(Map<String, dynamic> formData) {
    state = state.copyWith(
      signUpForm: formData,
    );
  }

}