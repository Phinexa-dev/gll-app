import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_submission_state.freezed.dart';

@freezed
class SurveySubmissionState with _$SurveySubmissionState {
  const factory SurveySubmissionState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isFailure,
    String? errorMessage,
  }) = _SurveySubmissionState;
}

