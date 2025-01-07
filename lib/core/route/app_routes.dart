import 'package:flutter/material.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/bottom_bar/presentation/ui/screen/bottom_bar.dart';
import 'package:gll/feature/other/presentation/ui/screen/profile_screen.dart';
import 'package:gll/feature/resources/presentation/ui/screen/sip_create_screen.dart';
import 'package:go_router/go_router.dart';
import '../../feature/other/presentation/ui/screen/edit_profile_screen.dart';
import '../../feature/welcome/presentation/ui/screen/welcome_screen.dart';


final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteName.welcome,
    name: RouteName.welcome,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => WelcomeScreen(),
  ),
  GoRoute(
    path: RouteName.dashboard,
    name: RouteName.dashboard,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => BottomBar(),
  ),
  GoRoute(
    path: RouteName.profile,
    name: RouteName.profile,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => ProfileScreen(),
  ),
  GoRoute(
    path: RouteName.editProfile,
    name: RouteName.editProfile,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => EditProfileScreen(),
  ),
    path: RouteName.createSip,
    name: RouteName.createSip,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => SipCreateScreen(),
  ),
];