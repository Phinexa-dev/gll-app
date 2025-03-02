import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:go_router/go_router.dart';
import '../data/local/auth/auth_notifier.dart';
import 'app_routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    refreshListenable: notifier,
    initialLocation: notifier.isInitialized? (notifier.isLoggedIn? RouteName.dashboard: RouteName.welcome): RouteName.splash,
    navigatorKey: navigationKey,
    routes: appRoutes,
    redirect: (context, state) {
      final isLoggedIn = notifier.isLoggedIn;
      final isInitialized = notifier.isInitialized;

      // no authentication routes
      final publicRoutes = [
        RouteName.welcome,
        // RouteName.login,
        // RouteName.signup,
        // RouteName.forgotPassword
      ];

      if (!isInitialized) {
        return RouteName.splash;
      }

      // Get the current location
      final location = state.matchedLocation;

      if (!isLoggedIn && !publicRoutes.contains(location)) {
        return RouteName.welcome;
      }

      if (isLoggedIn && publicRoutes.contains(location)) {
        return RouteName.dashboard;
      }

      return null;
    },
  );
});