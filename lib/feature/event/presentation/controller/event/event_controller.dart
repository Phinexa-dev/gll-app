import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/event/application/event/event_service.dart';
import 'package:gll/feature/event/presentation/state/event/event_state.dart';
import '../../../domain/model/event/event_data_model.dart';

final eventControllerProvider =
  AutoDisposeNotifierProvider<EventController, EventState>(
    EventController.new
  );

class EventController extends AutoDisposeNotifier<EventState> {

  @override
  EventState build() {
    getEvents();
    return EventState(isLoading: true);
  }

  Future<void> getEvents() async {
    try {
      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(eventServiceProvider).getEvents();

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        events: result,
      );
    } on DioException catch(e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage ?? 'Failed to load events',
      );
    } catch(e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'An unexpected error occurred',
      );
    }
  }

  Future<void> getEventById(int id) async {
    try {
      state = state.copyWith(
        isLoading: true,
        isSuccess: null,
        isFailure: null,
      );

      final result = await ref.read(eventServiceProvider).getEventById(id);

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFailure: false,
        selectedEvent: result,
      );
    } on DioException catch(e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: e.response?.statusMessage ?? 'Failed to load event',
      );
    } catch(e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'An unexpected error occurred',
      );
    }
  }

  // Helper method to filter events by type
  List<EventDataModel> getEventsByType(String eventType) {
    return state.events.where((event) => event.eventType == eventType).toList();
  }

  // Helper method to get upcoming events
  List<EventDataModel> getUpcomingEvents() {
    final now = DateTime.now();
    return state.events.where((event) => event.startDate.isAfter(now)).toList();
  }

  // Helper method to get past events
  List<EventDataModel> getPastEvents() {
    final now = DateTime.now();
    return state.events.where((event) => event.endDate.isBefore(now)).toList();
  }
}
