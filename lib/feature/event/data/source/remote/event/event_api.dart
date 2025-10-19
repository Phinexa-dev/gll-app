import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/feature/event/data/dto/response/event/event_response.dart';
import 'package:retrofit/retrofit.dart';

part 'event_api.g.dart';

final eventApiProvider = Provider<EventApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return EventApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class EventApi {
  factory EventApi(Dio dio) => _EventApi(dio);

  @GET('/event')
  Future<List<EventResponse>> getEvents();

  @GET('/event/{id}')
  Future<EventResponse> getEventById(@Path('id') int id);
}

