import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/events/presentation/ui/provider/survey_grid_notifier.dart';
import 'package:gll/feature/events/presentation/ui/provider/survey_radio_response_provider.dart';
import 'package:gll/feature/events/presentation/ui/provider/text_and_dropdown_reponses_provider.dart';
import 'package:gll/feature/home/presentation/ui/provider/%20phone_number_provider.dart';

import '../widgets/multi_select_checkbox_widget.dart';

Future<Map<String, dynamic>> combineSurveyResponses(WidgetRef ref) async {
  final multiSelectResponses = ref.read(surveyMultiSelectResponseProvider);
  final gridResponses = ref.read(surveyGridResponseProvider);
  final radioResponses = ref.read(radioQuestionResponseProvider);
  final textFieldResponses = ref.read(surveyTextFieldResponseProvider);

  final responses = {
    'phoneNumber': ref.watch(phoneNumberProvider).fullPhoneNumber,
    'multiSelect': multiSelectResponses,
    'grid': gridResponses,
    'radio': radioResponses,
    'textFields': textFieldResponses,
  };
  return responses;
}

void clearSurveyResponses(WidgetRef ref) {
  ref.read(phoneNumberProvider.notifier).clearPhoneNumber();
  ref.read(surveyMultiSelectResponseProvider.notifier).state = {};
  ref.read(surveyGridResponseProvider.notifier).state = {};
  ref.read(radioQuestionResponseProvider.notifier).state = {};
  ref.read(surveyTextFieldResponseProvider.notifier).state = {};
}
