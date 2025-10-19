import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/data/local/user/model/user_model.dart';
import '../../../core/data/local/user/user_service.dart';
import '../../../core/data/remote/network_service.dart';
import '../application/survey/survey_service.dart';
import '../presentation/state/survey_submission_state.dart';
import '../presentation/ui/provider/survey_state_notifier.dart';

final databaseRef = FirebaseDatabase.instance.ref();

Future<void> uploadSurveyData(
    WidgetRef ref, Map<String, dynamic> responses, int eventId, {bool isPostSurvey = false}) async {
  try {
    ref.read(surveySubmissionStateProvider.notifier).state =
        const SurveySubmissionState(isLoading: true);

    final surveyService = ref.read(surveyServiceProvider);

    if (isPostSurvey) {
      await surveyService.submitPostSurvey(eventId, responses);
    } else {
      await surveyService.submitPreSurvey(eventId, responses);
    }

    ref.read(surveyRefreshProvider.notifier).state++;

    ref.read(surveySubmissionStateProvider.notifier).state =
        const SurveySubmissionState(isSuccess: true, isLoading: false);

    print("Survey data uploaded successfully to backend!");
  } catch (error) {
    ref.read(surveySubmissionStateProvider.notifier).state =
        SurveySubmissionState(
          isFailure: true,
          isLoading: false,
          errorMessage: error.toString(),
        );

    print("Failed to upload survey data: $error");
    rethrow;
  }
}

Future<void> uploadPreSurveyData(
    WidgetRef ref, Map<String, dynamic> responses, int eventID) async {
  await uploadSurveyData(ref, responses, eventID, isPostSurvey: false);
}

Future<void> uploadPostSurveyData(
    WidgetRef ref, Map<String, dynamic> responses, int eventID) async {
  await uploadSurveyData(ref, responses, eventID, isPostSurvey: true);
}
