import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/event/data/dto/response/event/event_response.dart';
import 'package:gll/feature/event/data/source/remote/event/event_api.dart';
import 'ievent_repository.dart';

final eventRepositoryProvider = Provider<IEventRepository>((ref) {
  final EventApi eventApi = ref.watch(eventApiProvider);
  return EventRepository(eventApi);
});

final class EventRepository implements IEventRepository {
  final EventApi _eventApi;

  EventRepository(this._eventApi);

  @override
  Future<List<EventResponse>> getEvents() async {
    try {
      final response = await _eventApi.getEvents();
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<EventResponse> getEventById(int id) async {
    try {
      final response = await _eventApi.getEventById(id);
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}

