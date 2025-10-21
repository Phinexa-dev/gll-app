import '../../dto/response/event/event_response.dart';

abstract interface class IEventRepository {
  Future<List<EventResponse>> getEvents();
  Future<EventResponse> getEventById(int id);
}

