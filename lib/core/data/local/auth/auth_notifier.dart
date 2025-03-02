import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../user/iuser_service.dart';
import '../user/user_service.dart';

final routerNotifierProvider = ChangeNotifierProvider<RouterNotifier>((ref) {
  final userService = ref.watch(userServiceProvider);
  final notifier = RouterNotifier(userService);
  // Initialize immediately
  notifier.initialize();
  return notifier;
});

class RouterNotifier extends ChangeNotifier {
  final IUserService _userService;
  bool _isInitialized = false;
  bool _isLoggedIn = false;

  RouterNotifier(this._userService);

  // Initialize the router with user auth status
  Future<void> initialize() async {
    if (!_isInitialized) {
      _isLoggedIn = await _userService.isUserLoggedIn();
      _isInitialized = true;
      notifyListeners();
    }
  }

  bool get isLoggedIn => _isLoggedIn;
  bool get isInitialized => _isInitialized;

  Future<void> updateAuthState() async {
    final loggedIn = await _userService.isUserLoggedIn();
    if (loggedIn != _isLoggedIn) {
      _isLoggedIn = loggedIn;
      notifyListeners();
    }
  }
}