import 'package:gll/feature/event/data/dto/request/survey_request.dart';

abstract class ISurveyService {
  Future<bool> submitPreSurvey(int eventId, Map<String, dynamic> surveyData);
  Future<bool> submitPostSurvey(int eventId, Map<String, dynamic> surveyData);
}

