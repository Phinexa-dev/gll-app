import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadioStringQuestionNotifier extends StateNotifier<Map<String, String?>> {
  RadioStringQuestionNotifier() : super({});

  void updateResponse(String question, String? response) {
    state = {...state, question: response};
    print(state);
  }

  void clearRadioResponses() {
    state = {};
  }
}

final radioStringQuestionResponseProvider =
    StateNotifierProvider<RadioStringQuestionNotifier, Map<String, String?>>(
        (ref) {
  return RadioStringQuestionNotifier();
});
