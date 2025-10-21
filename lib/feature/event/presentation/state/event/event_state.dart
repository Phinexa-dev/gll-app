import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gll/feature/event/domain/model/event/event_data_model.dart';

part 'event_state.freezed.dart';

@freezed
class EventState with _$EventState {
  factory EventState({
    @Default(false) bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    @Default([]) List<EventDataModel> events,
    EventDataModel? selectedEvent,
  }) = _EventState;
}

