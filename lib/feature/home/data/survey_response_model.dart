class SurveyResponse {
  final String title;
  final Map<String, String> responses;

  SurveyResponse({required this.title, required this.responses});

  @override
  String toString() {
    return 'SurveyResponse(title: $title, responses: $responses)';
  }
}
