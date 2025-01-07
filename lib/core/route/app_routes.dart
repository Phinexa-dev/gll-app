import 'package:flutter/material.dart';
import 'package:gll/common/widget/event_view_screen_widget.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/bottom_bar/presentation/ui/screen/bottom_bar.dart';
import 'package:gll/feature/home/presentation/ui/screen/pre_survay_screen.dart';
import 'package:gll/feature/home/presentation/ui/screen/registration_form.dart';
import 'package:gll/feature/resources/presentation/ui/screen/sip_create_screen.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/resources_view_more_widget.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/sip_report_view_more.dart';
import 'package:go_router/go_router.dart';
import '../../feature/events/presentation/ui/screen/events_screen.dart';
import '../../feature/resources/presentation/ui/screen/resources_tab_screen.dart';
import '../../feature/resources/presentation/ui/widgets/sip_report_post_widget.dart';
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
    path: RouteName.createSip,
    name: RouteName.createSip,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => SipCreateScreen(),
  ),
  GoRoute(
    path: RouteName.events,
    name: RouteName.events,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => EventsScreen(),
  ),
  GoRoute(
    path: RouteName.eventDetails,
    name: RouteName.eventDetails,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => EventViewScreenWidget(),
  ),
  GoRoute(
    path: RouteName.registrationForm,
    name: RouteName.registrationForm,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => RegistrationForm(),
  ),
  GoRoute(
    path: RouteName.preSurvey,
    name: RouteName.preSurvey,
    parentNavigatorKey:navigationKey,
    builder: (context, state) => PreSurvayScreen(),
  ),
  GoRoute(
    path: RouteName.resourceMore,
    name: RouteName.resourceMore,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final resource = state.extra as Resource;
      return ResourcesViewMoreWidget(resource: resource);
    },
  ),
  GoRoute(
    path: RouteName.reportMore,
    name: RouteName.reportMore,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final report = state.extra as SipReport;
      return SipReportViewMore(report: report);
    },
  ),
];