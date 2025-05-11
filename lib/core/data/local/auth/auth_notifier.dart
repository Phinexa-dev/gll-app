import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/token/itoken_service.dart';
import '../../remote/network_service.dart';
import '../../remote/token/token_service.dart';
import '../user/iuser_service.dart';
import '../user/user_service.dart';

final routerNotifierProvider = ChangeNotifierProvider.family<RouterNotifier, Dio>((ref, dio) {
  final userService = ref.watch(userServiceProvider(dio));
  final tokenService = ref.watch(tokenServiceProvider(dio));
  final notifier = RouterNotifier(userService, tokenService);
  // Initialize immediately
  notifier.initialize();
  return notifier;
});

class RouterNotifier extends ChangeNotifier {
  final IUserService _userService;
  final ITokenService _tokenService;
  bool _isInitialized = false;
  bool _isLoggedIn = false;

  RouterNotifier(this._userService, this._tokenService);

  // Initialize the router with user auth status
  Future<void> initialize() async {
    if (!_isInitialized) {
      final isLoggedIn = await _userService.isUserLoggedIn();
      final hasToken = await _tokenService.hasToken();

      _isLoggedIn = isLoggedIn && hasToken;
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