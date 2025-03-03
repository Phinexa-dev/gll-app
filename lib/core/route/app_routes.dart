import 'package:flutter/material.dart';
import 'package:gll/common/widget/event_view_screen_widget.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/bottom_bar/presentation/ui/screen/bottom_bar.dart';
import 'package:gll/feature/events/data/event.dart';
import 'package:gll/feature/events/presentation/ui/screen/post_surveys/post_LA_survey/application_of_skills_screen.dart';
import 'package:gll/feature/events/presentation/ui/screen/post_surveys/post_LA_survey/module_specific_feedback_screen.dart';
import 'package:gll/feature/events/presentation/ui/screen/post_surveys/post_LA_survey/trainer_facilitation_feedback_screen.dart';
import 'package:gll/feature/events/presentation/ui/screen/post_surveys/post_SIP_survey/leadership_growth_screen.dart';
import 'package:gll/feature/events/presentation/ui/screen/post_surveys/post_SIP_survey/project_impact_screen.dart';
import 'package:gll/feature/events/presentation/ui/screen/post_surveys/post_SIP_survey/project_overview_screen.dart';
import 'package:gll/feature/events/presentation/ui/screen/post_surveys/post_SIP_survey/skills_application_screen.dart';
import 'package:gll/feature/events/presentation/ui/screen/registration_form.dart';
import 'package:gll/feature/other/presentation/ui/screen/camp_detail_screen.dart';
import 'package:gll/feature/other/presentation/ui/screen/profile_screen.dart';
import 'package:gll/feature/other/presentation/ui/screen/sip_map.dart';
import 'package:gll/feature/resources/presentation/ui/screen/sip_create_screen.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/resources_view_more_widget.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/sip_report_view_more.dart';
import 'package:go_router/go_router.dart';

import '../../feature/events/presentation/ui/screen/events_screen.dart';
import '../../feature/events/presentation/ui/screen/post_surveys/post_LA_survey/overall_program_feedback_screen.dart';
import '../../feature/events/presentation/ui/screen/post_surveys/post_TTT_survey/application_of_skills_screen.dart';
import '../../feature/events/presentation/ui/screen/post_surveys/post_TTT_survey/module_specific_feedback_screen.dart';
import '../../feature/events/presentation/ui/screen/post_surveys/post_TTT_survey/overall_program_feedback_screen.dart';
import '../../feature/events/presentation/ui/screen/post_surveys/post_TTT_survey/trainer_facilitation_feedback_screen.dart';
import '../../feature/events/presentation/ui/screen/pre_surveys/pre_survay_LA/background_information_screen.dart';
import '../../feature/events/presentation/ui/screen/pre_surveys/pre_survay_LA/goals_expectations_screen.dart';
import '../../feature/events/presentation/ui/screen/pre_surveys/pre_survay_LA/interests_and_engagement_screen.dart';
import '../../feature/events/presentation/ui/screen/pre_surveys/pre_survay_TTT/background_information_screen.dart';
import '../../feature/events/presentation/ui/screen/pre_surveys/pre_survay_TTT/goals_expectations_screen.dart';
import '../../feature/events/presentation/ui/screen/pre_surveys/pre_survay_TTT/interests_and_engagement_screen.dart';
import '../../feature/other/presentation/ui/screen/edit_profile_screen.dart';

import '../../feature/welcome/presentation/ui/screen/splash_screen.dart';
import '../../feature/other/presentation/ui/widget/map_view_widget.dart';
import '../../feature/resources/presentation/ui/screen/resources_tab_screen.dart';
import '../../feature/resources/presentation/ui/widgets/sip_report_post_widget.dart';
import '../../feature/welcome/presentation/ui/screen/welcome_screen.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteName.splash,
    builder: (context, state) => const SplashScreen(),
  ),
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
    builder: (context, state) {
      final event = state.extra as Event;
      return EventViewScreenWidget(event: event);
    },
  ),
  GoRoute(
    path: RouteName.registrationForm,
    name: RouteName.registrationForm,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final isTTT = state.extra as bool;
      return RegistrationForm(isTTT: isTTT);
    },
  ),

  ///LA PreSurvey Routes
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

  ///TT PreSurvey Routes
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

  ///LA PostSurvey Routes
  GoRoute(
    path: RouteName.laOverallProgramFeedbackScreen,
    name: RouteName.laOverallProgramFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => LAOverallProgramFeedbackScreen(),
  ),
  GoRoute(
    path: RouteName.laModuleSpecificFeedbackScreen,
    name: RouteName.laModuleSpecificFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => LAModuleSpecificFeedbackScreen(),
  ),
  GoRoute(
    path: RouteName.laTrainerFacilitationFeedbackScreen,
    name: RouteName.laTrainerFacilitationFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => LATrainerFacilitationFeedbackScreen(),
  ),
  GoRoute(
    path: RouteName.laApplicationOfSkillsScreen,
    name: RouteName.laApplicationOfSkillsScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => LAApplicationOfSkillsScreen(),
  ),

  ///TTT PostSurvey Routes
  GoRoute(
    path: RouteName.tttOverallProgramFeedbackScreen,
    name: RouteName.tttOverallProgramFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => TTTOverallProgramFeedbackScreen(),
  ),
  GoRoute(
    path: RouteName.tttModuleSpecificFeedbackScreen,
    name: RouteName.tttModuleSpecificFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => TTTModuleSpecificFeedbackScreen(),
  ),
  GoRoute(
    path: RouteName.tttTrainerFacilitationFeedbackScreen,
    name: RouteName.tttTrainerFacilitationFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => TTTTrainerFacilitationFeedbackScreen(),
  ),
  GoRoute(
    path: RouteName.tttApplicationOfSkillsScreen,
    name: RouteName.tttApplicationOfSkillsScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => TTTApplicationOfSkillsScreen(),
  ),

  ///SIP PostSurvey Routes
  GoRoute(
    path: RouteName.sipProjectOverviewScreen,
    name: RouteName.sipProjectOverviewScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SIPProjectOverviewScreen(),
  ),
  GoRoute(
    path: RouteName.sipSkillsApplicationScreen,
    name: RouteName.sipSkillsApplicationScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SIPSkillsApplicationScreen(),
  ),
  GoRoute(
    path: RouteName.sipProjectImpactScreen,
    name: RouteName.sipProjectImpactScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SIPProjectImpactScreen(),
  ),
  GoRoute(
    path: RouteName.sipLeadershipGrowthScreen,
    name: RouteName.sipLeadershipGrowthScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SIPLeadershipGrowthScreen(),
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
