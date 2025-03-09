import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/local/user/model/user_model.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isLoading, // Loading state
    bool? isSuccess, // Success state
    bool? isFailure, // Failure state
    String? errorMessage, // Error message
    UserModel? user, // The user data
  }) = _UserState;
}
