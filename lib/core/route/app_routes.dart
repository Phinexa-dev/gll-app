import 'package:flutter/material.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/signup/presentation/ui/widget/signup_screen.dart';
import 'package:go_router/go_router.dart';

import '../../feature/login/presentation/ui/widget/login_screen.dart';


final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteName.login,
    name: RouteName.login,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: RouteName.signup,
    name: RouteName.signup,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => SignUpScreen(),
  ),
];