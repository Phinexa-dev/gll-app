import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {

  factory ProfileState({
    @Default(false) bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    @Default({}) Map<String, dynamic>? form,
  }) = _ProfileState;
}
