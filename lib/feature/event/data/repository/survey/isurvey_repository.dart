import 'package:gll/feature/event/data/dto/request/survey_request.dart';
import 'package:gll/feature/event/data/dto/response/survey_response.dart';

abstract class ISurveyRepository {
  Future<SurveyResponse> submitPreSurvey(int eventId, PreSurveyRequest request);
  Future<SurveyResponse> submitPostSurvey(int eventId, PostSurveyRequest request);
}

