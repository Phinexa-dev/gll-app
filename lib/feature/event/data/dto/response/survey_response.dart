import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_response.freezed.dart';
part 'survey_response.g.dart';

@freezed
class SurveyResponse with _$SurveyResponse {
  const factory SurveyResponse({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "uid") required int uid,
    @JsonKey(name: "event_id") required int eventId,
    @JsonKey(name: "time") required DateTime time,
    @JsonKey(name: "pre_survey") dynamic preSurvey,
    @JsonKey(name: "survey") dynamic survey,
    @JsonKey(name: "post_survey") dynamic postSurvey,
    @JsonKey(name: "pre_survey_submitted") required bool preSurveySubmitted,
    @JsonKey(name: "survey_submitted") required bool surveySubmitted,
    @JsonKey(name: "post_survey_submitted") required bool postSurveySubmitted,
  }) = _SurveyResponse;

  factory SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseFromJson(json);
}

