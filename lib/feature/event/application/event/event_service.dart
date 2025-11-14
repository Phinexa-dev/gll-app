import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/event/domain/model/event/event_data_model.dart';
import '../../data/repository/event/ievent_repository.dart';
import '../../data/repository/event/event_repository.dart';
import 'ievent_service.dart';

final eventServiceProvider = Provider<EventService>((ref) {
  final eventRepository = ref.watch(eventRepositoryProvider);
  return EventService(eventRepository);
});

final class EventService implements IEventService {
  final IEventRepository _eventRepository;

  static const List<String> _eventImages = [
    "assets/events/event_1.png",
    "assets/events/event_2.png",
    "assets/events/event_3.png",
    "assets/events/event_4.png",
    "assets/events/event_5.png",
    "assets/events/event_6.png",
    "assets/events/event_7.png",
    "assets/events/event_8.png",
  ];

  EventService(this._eventRepository);

  @override
  Future<List<EventDataModel>> getEvents() async {
    try {
      final response = await _eventRepository.getEvents();
      final events = response.map((e) => _mapToEventDataModel(e)).toList();
      return events;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<EventDataModel> getEventById(int id) async {
    try {
      final response = await _eventRepository.getEventById(id);
      return _mapToEventDataModel(response);
    } on DioException catch (_) {
      rethrow;
    }
  }

  String _getEventImage(int eventId) {
    final random = Random(eventId);
    final imageIndex = random.nextInt(_eventImages.length);
    return _eventImages[imageIndex];
  }

  // Mapper: DTO → Domain Model
  EventDataModel _mapToEventDataModel(dynamic response) {
    return EventDataModel(
      id: response.id,
      name: response.name,
      startDate: DateTime.parse(response.startDate),
      endDate: DateTime.parse(response.endDate),
      location: response.location,
      latitude: response.latitude,
      longitude: response.longitude,
      description: response.description,
      subtitle: response.subtitle,
      eventType: response.eventType,
      image: _getEventImage(response.id),
      userEvents: response.userEvents
          .map<UserEventDataModel>((e) => _mapToUserEventDataModel(e))
          .toList(),
      eventGuests: response.eventGuests
          .map<EventGuestDataModel>((e) => _mapToEventGuestDataModel(e))
          .toList(),
    );
  }

  UserEventDataModel _mapToUserEventDataModel(dynamic response) {
    return UserEventDataModel(
      id: response.id,
      uid: response.uid,
      eventId: response.eventId,
      time: DateTime.parse(response.time),
      preSurvey: response.preSurvey,
      survey: response.survey,
      postSurvey: response.postSurvey,
      preSurveySubmitted: response.preSurveySubmitted,
      surveySubmitted: response.surveySubmitted,
      postSurveySubmitted: response.postSurveySubmitted,
      user: _mapToEventUserDataModel(response.user),
    );
  }

  EventUserDataModel _mapToEventUserDataModel(dynamic response) {
    return EventUserDataModel(
      id: response.id,
      fullName: response.fullName,
      email: response.email,
    );
  }

  EventGuestDataModel _mapToEventGuestDataModel(dynamic response) {
    return EventGuestDataModel(
      id: response.id,
      name: response.name,
    );
  }
}
