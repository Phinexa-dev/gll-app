import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_response.freezed.dart';
part 'event_response.g.dart';

@freezed
class EventResponse with _$EventResponse {
  const factory EventResponse({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "name")
    required String name,
    @JsonKey(name: "start_date")
    required String startDate,
    @JsonKey(name: "end_date")
    required String endDate,
    @JsonKey(name: "location")
    required String location,
    @JsonKey(name: "latitude")
    required String latitude,
    @JsonKey(name: "longitude")
    required String longitude,
    @JsonKey(name: "description")
    required String description,
    @JsonKey(name: "subtitle")
    required String subtitle,
    @JsonKey(name: "event_type")
    required String eventType,
    @JsonKey(name: "userevent")
    required List<UserEventResponse> userEvents,
    @JsonKey(name: "eventguest")
    required List<EventGuestResponse> eventGuests,
  }) = _EventResponse;

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
    _$EventResponseFromJson(json);
}

@freezed
class UserEventResponse with _$UserEventResponse {
  const factory UserEventResponse({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "uid")
    required int uid,
    @JsonKey(name: "event_id")
    required int eventId,
    @JsonKey(name: "time")
    required String time,
    @JsonKey(name: "pre_survey")
    dynamic preSurvey,
    @JsonKey(name: "survey")
    dynamic survey,
    @JsonKey(name: "post_survey")
    dynamic postSurvey,
    @JsonKey(name: "pre_survey_submitted")
    required bool preSurveySubmitted,
    @JsonKey(name: "survey_submitted")
    required bool surveySubmitted,
    @JsonKey(name: "post_survey_submitted")
    required bool postSurveySubmitted,
    @JsonKey(name: "user")
    required EventUserResponse user,
  }) = _UserEventResponse;

  factory UserEventResponse.fromJson(Map<String, dynamic> json) =>
    _$UserEventResponseFromJson(json);
}

@freezed
class EventUserResponse with _$EventUserResponse {
  const factory EventUserResponse({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "fullName")
    required String fullName,
    @JsonKey(name: "email")
    required String email,
  }) = _EventUserResponse;

  factory EventUserResponse.fromJson(Map<String, dynamic> json) =>
    _$EventUserResponseFromJson(json);
}

@freezed
class EventGuestResponse with _$EventGuestResponse {
  const factory EventGuestResponse({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "name")
    required String name,
  }) = _EventGuestResponse;

  factory EventGuestResponse.fromJson(Map<String, dynamic> json) =>
    _$EventGuestResponseFromJson(json);
}

