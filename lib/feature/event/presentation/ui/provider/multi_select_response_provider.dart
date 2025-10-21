import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurveyMultiSelectNotifier
    extends StateNotifier<Map<String, List<String>>> {
  SurveyMultiSelectNotifier() : super({});

  void updateResponse(String question, List<String> selectedAnswers) {
    state = {...state, question: selectedAnswers};
  }

  void clearMultiResponses() {
    state = {};
  }
}

final surveyMultiSelectResponseProvider =
    StateNotifierProvider<SurveyMultiSelectNotifier, Map<String, List<String>>>(
        (ref) {
  return SurveyMultiSelectNotifier();
});
