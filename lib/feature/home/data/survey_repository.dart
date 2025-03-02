import 'package:gll/feature/home/data/survey_model.dart';

class SurveyRepository {
  Future<List<SurveyModel>> fetchSurveys() async {
    return [
      SurveyModel(
        title: "Day 1",
        questions: [
          "Sustainable Development Goals, Vision Trees",
          "Leadership 101: Direction, Alignment, and Commitment",
          "Perspectives and Mindset",
        ],
      ),
      SurveyModel(
        title: "Day 2",
        questions: [
          "Communication & Feedback/SBI",
          "Values and Actions",
          "Working in Teams",
        ],
      ),
    ];
  }
}
