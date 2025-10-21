import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState({
    @Default(false) bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    @Default({}) Map<String, dynamic>? signUpForm,
    @Default(1) int stage,
    String? enteredCode,
    @Default(0) int resendCooldownSeconds,
    @Default(false) bool isVerifying,
  }) = _SignUpState;
}
