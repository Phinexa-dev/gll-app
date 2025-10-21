import 'package:flutter/material.dart';
import 'package:gll/common/widget/event_view_screen_widget.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/bottom_bar/presentation/ui/screen/bottom_bar.dart';
import 'package:gll/feature/event/domain/model/event/event_data_model.dart';
import 'package:gll/feature/login/presentation/ui/screen/login.dart';
import 'package:gll/feature/login/presentation/ui/screen/password_reset_screens/forget_password_screen.dart';
import 'package:gll/feature/login/presentation/ui/screen/password_reset_screens/otp_screen.dart';
import 'package:gll/feature/login/presentation/ui/screen/password_reset_screens/success_reset_screen.dart';
import 'package:gll/feature/other/presentation/ui/screen/camp_detail_screen.dart';
import 'package:gll/feature/other/presentation/ui/screen/contact_us/contact_us.dart';
import 'package:gll/feature/other/presentation/ui/screen/faqs/faq.dart';
import 'package:gll/feature/other/presentation/ui/screen/profile_screen.dart';
import 'package:gll/feature/other/presentation/ui/screen/sip_map.dart';
import 'package:gll/feature/resources/domain/model/sip_report/sip_report_model.dart';
import 'package:gll/feature/resources/presentation/ui/screen/sip_create_screen.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/sip_report_detail_screen.dart';
import 'package:gll/feature/signup/presentation/ui/screen/signup.dart';
import 'package:go_router/go_router.dart';

import '../../feature/event/presentation/ui/screen/events_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_LA_survey/application_of_skills_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_LA_survey/module_specific_feedback_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_LA_survey/overall_program_feedback_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_LA_survey/trainer_facilitation_feedback_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_SIP_survey/leadership_growth_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_SIP_survey/project_impact_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_SIP_survey/project_overview_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_SIP_survey/skills_application_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_TTT_survey/application_of_skills_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_TTT_survey/module_specific_feedback_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_TTT_survey/overall_program_feedback_screen.dart';
import '../../feature/event/presentation/ui/screen/post_surveys/post_TTT_survey/trainer_facilitation_feedback_screen.dart';
import '../../feature/event/presentation/ui/screen/pre_surveys/pre_survay_LA/background_information_screen.dart';
import '../../feature/event/presentation/ui/screen/pre_surveys/pre_survay_LA/goals_expectations_screen.dart';
import '../../feature/event/presentation/ui/screen/pre_surveys/pre_survay_LA/interests_and_engagement_screen.dart';
import '../../feature/event/presentation/ui/screen/pre_surveys/pre_survay_TTT/background_information_screen.dart';
import '../../feature/event/presentation/ui/screen/pre_surveys/pre_survay_TTT/goals_expectations_screen.dart';
import '../../feature/event/presentation/ui/screen/pre_surveys/pre_survay_TTT/interests_and_engagement_screen.dart';
import '../../feature/event/presentation/ui/screen/registration_form.dart';
import '../../feature/home/presentation/ui/widgets/pdf_viewer.dart';
import '../../feature/other/presentation/ui/screen/about_us/about_us.dart';
import '../../feature/other/presentation/ui/screen/edit_profile_screen.dart';
import '../../feature/other/presentation/ui/screen/feedbacks/feedbacks.dart';
import '../../feature/welcome/presentation/ui/screen/splash_screen.dart';
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
    path: RouteName.signIn,
    name: RouteName.signIn,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => Login(),
  ),
  GoRoute(
    path: RouteName.signUp,
    name: RouteName.signUp,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SignUp(),
  ),
  GoRoute(
    path: RouteName.forgetPasswordScreen,
    name: RouteName.forgetPasswordScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => ForgetPasswordScreen(),
  ),
  GoRoute(
    path: RouteName.otpScreen,
    name: RouteName.otpScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => OTPScreen(),
  ),
  GoRoute(
    path: RouteName.successResetScreen,
    name: RouteName.successResetScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => SuccessResetScreen(),
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
      final event = state.extra as EventDataModel;
      return EventViewScreenWidget(event: event);
    },
  ),
  GoRoute(
    path: RouteName.registrationForm,
    name: RouteName.registrationForm,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      if (state.extra is! Map<String, dynamic>) {
        throw Exception(
          'Invalid extra parameter: Expected Map<String, dynamic>',
        );
      }

      final extras = state.extra as Map<String, dynamic>;
      final isTTT = extras['isTTT'] as bool;
      final eventID = extras['eventID'] as int;

      return RegistrationForm(isTTT: isTTT, eventID: eventID);
    },
  ),

  ///LA PreSurvey Routes
  GoRoute(
    path: RouteName.preSurvey,
    name: RouteName.preSurvey,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return BackgroundInformationScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.goalsExpectationsScreen,
    name: RouteName.goalsExpectationsScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return GoalsExpectationsScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.interestsAndEngagementScreen,
    name: RouteName.interestsAndEngagementScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return InterestsAndEngagementScreen(eventID: eventID);
    },
  ),

  ///TT PreSurvey Routes
  GoRoute(
    path: RouteName.ttPreSurvey,
    name: RouteName.ttPreSurvey,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return TTBackgroundInformationScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.ttGoalsExpectationsScreen,
    name: RouteName.ttGoalsExpectationsScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return TTGoalsExpectationsScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.ttInterestsAndEngagementScreen,
    name: RouteName.ttInterestsAndEngagementScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return TTInterestsAndEngagementScreen(eventID: eventID);
    },
  ),

  ///LA PostSurvey Routes
  GoRoute(
    path: RouteName.laOverallProgramFeedbackScreen,
    name: RouteName.laOverallProgramFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return LAOverallProgramFeedbackScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.laModuleSpecificFeedbackScreen,
    name: RouteName.laModuleSpecificFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return LAModuleSpecificFeedbackScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.laTrainerFacilitationFeedbackScreen,
    name: RouteName.laTrainerFacilitationFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return LATrainerFacilitationFeedbackScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.laApplicationOfSkillsScreen,
    name: RouteName.laApplicationOfSkillsScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return LAApplicationOfSkillsScreen(eventID: eventID);
    },
  ),

  ///TTT PostSurvey Routes
  GoRoute(
    path: RouteName.tttOverallProgramFeedbackScreen,
    name: RouteName.tttOverallProgramFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return TTTOverallProgramFeedbackScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.tttModuleSpecificFeedbackScreen,
    name: RouteName.tttModuleSpecificFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return TTTModuleSpecificFeedbackScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.tttTrainerFacilitationFeedbackScreen,
    name: RouteName.tttTrainerFacilitationFeedbackScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return TTTTrainerFacilitationFeedbackScreen(eventID: eventID);
    },
  ),
  GoRoute(
    path: RouteName.tttApplicationOfSkillsScreen,
    name: RouteName.tttApplicationOfSkillsScreen,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final eventID = state.extra as int;
      return TTTApplicationOfSkillsScreen(eventID: eventID);
    },
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
    path: RouteName.reportMore,
    name: RouteName.reportMore,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final report = state.extra as SipReportModel;
      return SipReportDetailScreen(report: report);
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
      final country = state.extra as String;
      return CampDetailScreen(country: country);
    },
  ),
  GoRoute(
    path: RouteName.pdfViewer,
    name: RouteName.pdfViewer,
    parentNavigatorKey: navigationKey,
    builder: (context, state) {
      final pdfAssetPath = state.extra as String;
      return PdfViewerScreen(pdfAssetPath: pdfAssetPath);
    },
  ),
  GoRoute(
    path: RouteName.feedbacks,
    name: RouteName.feedbacks,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => Feedbacks(),
  ),
  GoRoute(
    path: RouteName.aboutGL2,
    name: RouteName.aboutGL2,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => AboutUs(),
  ),
  GoRoute(
    path: RouteName.contactUs,
    name: RouteName.contactUs,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => ContactUs(),
  ),
  GoRoute(
    path: RouteName.faqs,
    name: RouteName.faqs,
    parentNavigatorKey: navigationKey,
    builder: (context, state) => FAQs(),
  ),
];
