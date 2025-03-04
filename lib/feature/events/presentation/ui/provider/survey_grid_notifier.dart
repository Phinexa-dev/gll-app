import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurveyGridNotifier extends StateNotifier<Map<String, int>> {
  SurveyGridNotifier() : super({});

  void updateResponse(String question, int response) {
    state = {...state, question: response};
    print(state);
  }

  void clearGridResponses() {
    state = {};
  }
}

final surveyGridResponseProvider =
    StateNotifierProvider<SurveyGridNotifier, Map<String, int>>((ref) {
  return SurveyGridNotifier();
});
