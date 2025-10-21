import '../../domain/model/event/event_data_model.dart';

abstract interface class IEventService {
  Future<List<EventDataModel>> getEvents();
  Future<EventDataModel> getEventById(int id);
}

