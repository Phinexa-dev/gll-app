class SurveyGridRepository {
  @override
  Future<List<String>> fetchGridSurveys() async {
    return [
      "Credibility and expertise",
      "Connection with participants",
      "Ability to manage group conversations effectively",
      "Knowledge of the content",
      "Clarity in delivery and presentation",
    ];
  }
}
