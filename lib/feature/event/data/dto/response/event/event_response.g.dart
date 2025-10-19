// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventResponseImpl _$$EventResponseImplFromJson(Map<String, dynamic> json) =>
    _$EventResponseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      location: json['location'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      description: json['description'] as String,
      subtitle: json['subtitle'] as String,
      eventType: json['event_type'] as String,
      userEvents: (json['userevent'] as List<dynamic>)
          .map((e) => UserEventResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventGuests: (json['eventguest'] as List<dynamic>)
          .map((e) => EventGuestResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventResponseImplToJson(_$EventResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
      'subtitle': instance.subtitle,
      'event_type': instance.eventType,
      'userevent': instance.userEvents,
      'eventguest': instance.eventGuests,
    };

_$UserEventResponseImpl _$$UserEventResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UserEventResponseImpl(
  id: (json['id'] as num).toInt(),
  uid: (json['uid'] as num).toInt(),
  eventId: (json['event_id'] as num).toInt(),
  time: json['time'] as String,
  preSurvey: json['pre_survey'],
  survey: json['survey'],
  postSurvey: json['post_survey'],
  preSurveySubmitted: json['pre_survey_submitted'] as bool,
  surveySubmitted: json['survey_submitted'] as bool,
  postSurveySubmitted: json['post_survey_submitted'] as bool,
  user: EventUserResponse.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserEventResponseImplToJson(
  _$UserEventResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'event_id': instance.eventId,
  'time': instance.time,
  'pre_survey': instance.preSurvey,
  'survey': instance.survey,
  'post_survey': instance.postSurvey,
  'pre_survey_submitted': instance.preSurveySubmitted,
  'survey_submitted': instance.surveySubmitted,
  'post_survey_submitted': instance.postSurveySubmitted,
  'user': instance.user,
};

_$EventUserResponseImpl _$$EventUserResponseImplFromJson(
  Map<String, dynamic> json,
) => _$EventUserResponseImpl(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$$EventUserResponseImplToJson(
  _$EventUserResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
};

_$EventGuestResponseImpl _$$EventGuestResponseImplFromJson(
  Map<String, dynamic> json,
) => _$EventGuestResponseImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
);

Map<String, dynamic> _$$EventGuestResponseImplToJson(
  _$EventGuestResponseImpl instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
