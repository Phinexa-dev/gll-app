import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_data_model.freezed.dart';

@freezed
class EventDataModel with _$EventDataModel {
  const factory EventDataModel({
    required int id,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required String latitude,
    required String longitude,
    required String description,
    required String subtitle,
    required String eventType,
    required String image,
    required List<UserEventDataModel> userEvents,
    required List<EventGuestDataModel> eventGuests,
  }) = _EventDataModel;
}

@freezed
class UserEventDataModel with _$UserEventDataModel {
  const factory UserEventDataModel({
    required int id,
    required int uid,
    required int eventId,
    required DateTime time,
    dynamic preSurvey,
    dynamic survey,
    dynamic postSurvey,
    required bool preSurveySubmitted,
    required bool surveySubmitted,
    required bool postSurveySubmitted,
    required EventUserDataModel user,
  }) = _UserEventDataModel;
}

@freezed
class EventUserDataModel with _$EventUserDataModel {
  const factory EventUserDataModel({
    required int id,
    required String fullName,
    required String email,
  }) = _EventUserDataModel;
}

@freezed
class EventGuestDataModel with _$EventGuestDataModel {
  const factory EventGuestDataModel({
    required int id,
    required String name,
  }) = _EventGuestDataModel;
}
