import 'package:flutter_riverpod/flutter_riverpod.dart';

final surveyTextFieldResponseProvider =
    StateNotifierProvider<SurveyTextFieldNotifier, Map<String, String>>((ref) {
  return SurveyTextFieldNotifier();
});

class SurveyTextFieldNotifier extends StateNotifier<Map<String, String>> {
  SurveyTextFieldNotifier() : super({});

  void updateResponse(String fieldName, String value) {
    state = {...state, fieldName: value};
  }

  void clearTextFieldResponses() {
    state = {};
  }
}
