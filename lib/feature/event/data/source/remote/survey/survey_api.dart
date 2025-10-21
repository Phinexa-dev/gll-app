import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/feature/event/data/dto/request/survey_request.dart';
import 'package:gll/feature/event/data/dto/response/survey_response.dart';
import 'package:retrofit/retrofit.dart';

part 'survey_api.g.dart';

final surveyApiProvider = Provider<SurveyApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return SurveyApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class SurveyApi {
  factory SurveyApi(Dio dio) => _SurveyApi(dio);

  @POST('/user-event/survey/{eventId}')
  Future<SurveyResponse> submitPreSurvey(
    @Path('eventId') int eventId,
    @Body() PreSurveyRequest request,
  );

  @POST('/user-event/post-survey/{eventId}')
  Future<SurveyResponse> submitPostSurvey(
    @Path('eventId') int eventId,
    @Body() PostSurveyRequest request,
  );
}

