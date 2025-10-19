abstract class ISurveyService {
  Future<bool> submitPreSurvey(int eventId, Map<String, dynamic> surveyData);
  Future<bool> submitPostSurvey(int eventId, Map<String, dynamic> surveyData);
}

