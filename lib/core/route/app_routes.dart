import 'package:flutter/material.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/signup.dart';
import 'package:go_router/go_router.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/login.dart';


final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteName.login,
    name: RouteName.login,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => Login(),
  ),
  GoRoute(
    path: RouteName.signup,
    name: RouteName.signup,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => SignUp(),
  ),
];