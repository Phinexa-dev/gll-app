class SurveyGridResponseModel {
  final String question;
  final int response;

  SurveyGridResponseModel({required this.question, required this.response});

  Map<String, dynamic> toJson() => {
        'question': question,
        'response': response,
      };
}
