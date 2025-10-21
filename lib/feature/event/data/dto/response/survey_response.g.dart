// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyResponseImpl _$$SurveyResponseImplFromJson(Map<String, dynamic> json) =>
    _$SurveyResponseImpl(
      id: (json['id'] as num).toInt(),
      uid: (json['uid'] as num).toInt(),
      eventId: (json['event_id'] as num).toInt(),
      time: DateTime.parse(json['time'] as String),
      preSurvey: json['pre_survey'],
      survey: json['survey'],
      postSurvey: json['post_survey'],
      preSurveySubmitted: json['pre_survey_submitted'] as bool,
      surveySubmitted: json['survey_submitted'] as bool,
      postSurveySubmitted: json['post_survey_submitted'] as bool,
    );

Map<String, dynamic> _$$SurveyResponseImplToJson(
  _$SurveyResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'event_id': instance.eventId,
  'time': instance.time.toIso8601String(),
  'pre_survey': instance.preSurvey,
  'survey': instance.survey,
  'post_survey': instance.postSurvey,
  'pre_survey_submitted': instance.preSurveySubmitted,
  'survey_submitted': instance.surveySubmitted,
  'post_survey_submitted': instance.postSurveySubmitted,
};
