import 'package:flutter/material.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:go_router/go_router.dart';
import '../../feature/welcome/presentation/ui/screen/welcome_screen.dart';


final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteName.welcome,
    name: RouteName.welcome,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => WelcomeScreen(),
  ),
];