import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadioQuestionNotifier extends StateNotifier<Map<String, bool?>> {
  RadioQuestionNotifier() : super({});

  void updateResponse(String question, bool? response) {
    state = {...state, question: response};
  }

  void clearRadioResponses() {
    state = {};
  }
}

final radioQuestionResponseProvider =
    StateNotifierProvider<RadioQuestionNotifier, Map<String, bool?>>((ref) {
  return RadioQuestionNotifier();
});
