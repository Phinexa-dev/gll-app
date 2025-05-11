import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local/user/user_service.dart';
import '../../data/remote/network_service.dart';
import '../notifier/user_notifier.dart';
import '../state/user_state.dart';

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
      final dio = ref.watch(networkServiceProvider);
      final userService = ref.watch(userServiceProvider(dio));
      return UserNotifier(userService);
});
