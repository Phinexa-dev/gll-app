import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/presentation/state/user_state.dart';

import '../../data/local/user/iuser_service.dart';
import '../../data/local/user/model/user_model.dart';

class UserNotifier extends StateNotifier<UserState> {
  final IUserService _userService;

  UserNotifier(this._userService) : super(const UserState());

  Future<void> loadUser() async {
    state = state.copyWith(isLoading: true);

    try {
      final user = await _userService.getUser();
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isFailure: true,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> saveUser(UserModel user) async {
    state = state.copyWith(isLoading: true);

    try {
      await _userService.saveUser(user);
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isFailure: true,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> clearUser() async {
    state = state.copyWith(isLoading: true); // Set loading state

    try {
      await _userService.clearUser(); // Clear user data
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        user: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isFailure: true,
        errorMessage: e.toString(),
      );
    }
  }
}
