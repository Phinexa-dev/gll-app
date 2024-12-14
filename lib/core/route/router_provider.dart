import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll_app/core/route/route_name.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
      return GoRouter(
        initialLocation: RouteName.login,
        navigatorKey: navigationKey,
        routes: appRoutes,
      );
    });