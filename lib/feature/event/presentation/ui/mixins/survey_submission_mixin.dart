import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/survey_upload_service.dart';
import '../../state/survey_submission_state.dart';
import '../provider/combine_response.dart';
import '../provider/survey_state_notifier.dart';

mixin SurveySubmissionMixin {
  Future<void> submitPreSurvey({
    required WidgetRef ref,
    required BuildContext context,
    required int eventId,
    required VoidCallback onSuccess,
    VoidCallback? onError,
  }) async {
    try {
      final responses = await formatSurveyForAPI(ref);
      await uploadPreSurveyData(ref, responses, eventId);

      if (context.mounted) {
        onSuccess();
      }
    } catch (error) {
      if (context.mounted) {
        if (onError != null) {
          onError();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to submit survey: ${_getErrorMessage(error)}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } finally {
      ref.read(surveySubmissionStateProvider.notifier).state =
          const SurveySubmissionState();
    }
  }

  Future<void> submitPostSurvey({
    required WidgetRef ref,
    required BuildContext context,
    required int eventId,
    required VoidCallback onSuccess,
    VoidCallback? onError,
  }) async {
    try {
      final responses = await formatSurveyForAPI(ref);
      await uploadPostSurveyData(ref, responses, eventId);

      if (context.mounted) {
        onSuccess();
      }
    } catch (error) {
      if (context.mounted) {
        if (onError != null) {
          onError();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to submit survey: ${_getErrorMessage(error)}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } finally {
      ref.read(surveySubmissionStateProvider.notifier).state =
          const SurveySubmissionState();
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('401')) {
      return 'Authentication failed. Please log in again.';
    } else if (error.toString().contains('404')) {
      return 'Event not found.';
    } else if (error.toString().contains('500')) {
      return 'Server error. Please try again later.';
    } else if (error.toString().contains('Network')) {
      return 'Network error. Please check your connection.';
    } else {
      return 'An unexpected error occurred.';
    }
  }
}

