import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {

  factory SignInState({
    @Default(false) bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    @Default({}) Map<String, dynamic>? signInForm,
  }) = _SignInState;
}
