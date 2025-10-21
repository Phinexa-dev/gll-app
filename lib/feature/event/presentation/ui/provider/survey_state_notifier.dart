import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/event/presentation/state/survey_submission_state.dart';

final isLoadingProvider = StateProvider<bool>((ref) => false);

final surveyRefreshProvider = StateProvider<int>((ref) => 0);

final surveySubmissionStateProvider = StateProvider<SurveySubmissionState>(
  (ref) => const SurveySubmissionState(),
);
