import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_request.freezed.dart';
part 'survey_request.g.dart';

@freezed
class PreSurveyRequest with _$PreSurveyRequest {
  const factory PreSurveyRequest({
    @JsonKey(name: "survey") required Map<String, dynamic> survey,
  }) = _PreSurveyRequest;

  factory PreSurveyRequest.fromJson(Map<String, dynamic> json) =>
      _$PreSurveyRequestFromJson(json);
}

@freezed
class PostSurveyRequest with _$PostSurveyRequest {
  const factory PostSurveyRequest({
    @JsonKey(name: "post_survey") required Map<String, dynamic> postSurvey,
  }) = _PostSurveyRequest;

  factory PostSurveyRequest.fromJson(Map<String, dynamic> json) =>
      _$PostSurveyRequestFromJson(json);
}

