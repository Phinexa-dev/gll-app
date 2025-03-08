import 'package:flutter/material.dart';

@immutable
class RouteName {
  const RouteName._();

  static String get splash => '/splash';
  static String get welcome => '/welcome';

  static String get signIn => '/login';
  static String get signUp => '/signup';

  static String get dashboard => '/dashboard';

  static String get events => '/events';

  static String get eventDetails => '/eventDetails';

  static String get registrationForm => '/registrationForm';

  ///TTT PreSurvey Routes
  static String get ttPreSurvey => '/ttPreSurvey';

  static String get ttGoalsExpectationsScreen => '/ttGoalsExpectationsScreen';

  static String get ttInterestsAndEngagementScreen =>
      '/ttInterestsAndEngagementScreen';

  ///LA PreSurvey Routes
  static String get preSurvey => '/preSurvey';

  static String get goalsExpectationsScreen => '/goalsExpectationsScreen';

  static String get interestsAndEngagementScreen =>
      '/interestsAndEngagementScreen';

  ///LA PostSurvey Routes
  static String get laOverallProgramFeedbackScreen =>
      '/laOverallProgramFeedbackScreen';

  static String get laModuleSpecificFeedbackScreen =>
      '/laModuleSpecificFeedbackScreen';

  static String get laTrainerFacilitationFeedbackScreen =>
      '/laTrainerFacilitationFeedbackScreen';

  static String get laApplicationOfSkillsScreen =>
      '/laApplicationOfSkillsScreen';

  ///TTT PostSurvey Routes
  static String get tttOverallProgramFeedbackScreen =>
      '/tttOverallProgramFeedbackScreen';

  static String get tttModuleSpecificFeedbackScreen =>
      '/tttModuleSpecificFeedbackScreen';

  static String get tttTrainerFacilitationFeedbackScreen =>
      '/tttTrainerFacilitationFeedbackScreen';

  static String get tttApplicationOfSkillsScreen =>
      '/tttApplicationOfSkillsScreen';

  ///SIP PostSurvey Routes
  static String get sipProjectOverviewScreen => '/sipProjectOverviewScreen';

  static String get sipSkillsApplicationScreen => '/sipSkillsApplicationScreen';

  static String get sipProjectImpactScreen => '/sipProjectImpactScreen';

  static String get sipLeadershipGrowthScreen => '/sipLeadershipGrowthScreen';

  ///End

  static String get profile => '/profile';

  static String get editProfile => '/editProfile';

  static String get settings => '/settings';

  static String get newsletter => '/newsletter';

  static String get worldMap => '/worldMap';

  static String get facultyResources => '/facultyResources';

  static String get aboutGL2 => '/aboutGL2';

  static String get contactUs => '/contactUs';

  static String get faqs => '/faqs';

  static String get feedbacks => '/feedbacks';

  static String get help => '/help';

  static String get createSip => '/createSip';

  static String get resourceMore => '/resourceMore';

  static String get reportMore => '/reportMore';

  static String get campMoreDetail => '/campMoreDetail';
}
