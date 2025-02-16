import 'package:flutter/material.dart';
import 'package:gll/common/widget/event_view_screen_widget.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/bottom_bar/presentation/ui/screen/bottom_bar.dart';
import 'package:gll/feature/home/presentation/ui/screen/pre_survay_trainer/background_information_screen.dart';
import 'package:gll/feature/home/presentation/ui/screen/pre_survay_trainer/interests_and_engagement_screen.dart';
import 'package:gll/feature/home/presentation/ui/screen/registration_form.dart';
import 'package:gll/feature/other/presentation/ui/screen/camp_detail_screen.dart';
import 'package:gll/feature/other/presentation/ui/screen/profile_screen.dart';
import 'package:gll/feature/other/presentation/ui/screen/sip_map.dart';
import 'package:gll/feature/resources/presentation/ui/screen/sip_create_screen.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/resources_view_more_widget.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/sip_report_view_more.dart';
import 'package:go_router/go_router.dart';

import '../../feature/events/presentation/ui/screen/events_screen.dart';
import '../../feature/home/presentation/ui/screen/pre_survay/background_information_screen.dart';
import '../../feature/home/presentation/ui/screen/pre_survay/goals_expectations_screen.dart';
import '../../feature/home/presentation/ui/screen/pre_survay/interests_and_engagement_screen.dart';
import '../../feature/home/presentation/ui/screen/pre_survay_trainer/goals_expectations_screen.dart';
import '../../feature/other/presentation/ui/screen/edit_profile_screen.dart';
import '../../feature/other/presentation/ui/widget/map_view_widget.dart';
import '../../feature/resources/presentation/ui/screen/resources_tab_screen.dart';
import '../../feature/resources/presentation/ui/widgets/sip_report_post_widget.dart';
import '../../feature/welcome/presentation/ui/screen/welcome_screen.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteName.welcome,
    name: RouteName.welcome,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => WelcomeScreen(),
  ),
  GoRoute(
    path: RouteName.dashboard,
    name: RouteName.dashboard,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => BottomBar(),
  ),
  GoRoute(
    path: RouteName.profile,
    name: RouteName.profile,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => ProfileScreen(),
  ),
  GoRoute(
    path: RouteName.editProfile,
    name: RouteName.editProfile,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => EditProfileScreen(),
  ),
  GoRoute(
    path: RouteName.createSip,
    name: RouteName.createSip,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SipCreateScreen(),
  ),
  GoRoute(
    path: RouteName.events,
    name: RouteName.events,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => EventsScreen(),
  ),
  GoRoute(
    path: RouteName.eventDetails,
    name: RouteName.eventDetails,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => EventViewScreenWidget(),
  ),
  GoRoute(
    path: RouteName.registrationForm,
    name: RouteName.registrationForm,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => RegistrationForm(),
  ),
  GoRoute(
    path: RouteName.preSurvey,
    name: RouteName.preSurvey,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => BackgroundInformationScreen(),
  ),
  GoRoute(
    path: RouteName.goalsExpectationsScreen,
    name: RouteName.goalsExpectationsScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => GoalsExpectationsScreen(),
  ),
  GoRoute(
    path: RouteName.interestsAndEngagementScreen,
    name: RouteName.interestsAndEngagementScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => InterestsAndEngagementScreen(),
  ),
  GoRoute(
    path: RouteName.ttPreSurvey,
    name: RouteName.ttPreSurvey,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => TTBackgroundInformationScreen(),
  ),
  GoRoute(
    path: RouteName.ttGoalsExpectationsScreen,
    name: RouteName.ttGoalsExpectationsScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => TTGoalsExpectationsScreen(),
  ),
  GoRoute(
    path: RouteName.ttInterestsAndEngagementScreen,
    name: RouteName.ttInterestsAndEngagementScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => TTInterestsAndEngagementScreen(),
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
  GoRoute(
    path: RouteName.worldMap,
    name: RouteName.worldMap,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SipMap(),
  ),
  GoRoute(
    path: RouteName.campMoreDetail,
    name: RouteName.campMoreDetail,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final event = state.extra as CampEvent;
      return CampDetailScreen(
        event: event,
      );
    },
  ),
];
