import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/route/app_routes.dart';
import '../../../../../application/survey_upload_service.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class TTTApplicationOfSkillsScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const TTTApplicationOfSkillsScreen({
    super.key,
    required this.eventIdentity,
  });

  @override
  _TTTApplicationOfSkillsScreenState createState() =>
      _TTTApplicationOfSkillsScreenState();
}

class _TTTApplicationOfSkillsScreenState
    extends ConsumerState<TTTApplicationOfSkillsScreen> {
  late TextEditingController suggestionsController;

  // Track errors for each question
  final _radioErrors = {
    "I feel confident in my ability to facilitate the Leadership Academy modules":
        ValueNotifier<String?>(null),
    "I can effectively use the facilitation skills gained during the workshop":
        ValueNotifier<String?>(null),
    "I am prepared to deliver the Sustainable Impact Plan module":
        ValueNotifier<String?>(null),
    "I am interested in facilitating future Leadership Academy workshops":
        ValueNotifier<String?>(null),
  };

  final _suggestionsError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    suggestionsController = TextEditingController();

    // Initialize suggestions from provider if available
    final surveyResponses = ref.read(surveyTextFieldResponseProvider);
    suggestionsController.text = surveyResponses[
            "Do you have any suggestions to improve the Leadership Academy for future participants?"] ??
        '';
  }

  @override
  void dispose() {
    // Dispose all value notifiers
    for (var error in _radioErrors.values) {
      error.dispose();
    }
    _suggestionsError.dispose();
    suggestionsController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    bool isValid = true;

    // Validate radio buttons
    final radioResponses = ref.read(radioQuestionResponseProvider);
    for (var question in _radioErrors.keys) {
      if (radioResponses[question] == null) {
        _radioErrors[question]!.value = 'Please answer this question';
        isValid = false;
      } else {
        _radioErrors[question]!.value = null;
      }
    }

    // Validate suggestions field
    if (suggestionsController.text.isEmpty) {
      _suggestionsError.value = 'Please provide suggestions';
      isValid = false;
    } else {
      _suggestionsError.value = null;
    }

    // If the form is valid, navigate to the next screen
    if (isValid) {
      final responses = await combineSurveyResponses(ref);
      uploadSurveyData(ref, responses, 'Post_Survey_${widget.eventIdentity}');
      clearSurveyResponses(ref);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        GoRouter.of(navigationKey.currentContext!).go(RouteName.dashboard);
      });
    } else {
      // Optionally show a snackbar or handle invalid form
      print("Form is not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Flexible(
          child: Text(
            'Post Survey - Train the Trainer',
            style: PhinexaFont.highlightAccent,
            maxLines: 2, // Allow text to break into two lines
            overflow: TextOverflow.ellipsis, // Show '...' if text overflows
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Application of Skills",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(height: 20),

              // Question 1
              _buildRadioQuestion(
                "I feel confident in my ability to facilitate the Leadership Academy modules",
                _radioErrors[
                    "I feel confident in my ability to facilitate the Leadership Academy modules"]!,
              ),
              SizedBox(height: 10),

              // Question 2
              _buildRadioQuestion(
                "I can effectively use the facilitation skills gained during the workshop",
                _radioErrors[
                    "I can effectively use the facilitation skills gained during the workshop"]!,
              ),
              SizedBox(height: 10),

              // Question 3
              _buildRadioQuestion(
                "I am prepared to deliver the Sustainable Impact Plan module",
                _radioErrors[
                    "I am prepared to deliver the Sustainable Impact Plan module"]!,
              ),
              SizedBox(height: 10),

              // Question 4
              _buildRadioQuestion(
                "I am interested in facilitating future Leadership Academy workshops",
                _radioErrors[
                    "I am interested in facilitating future Leadership Academy workshops"]!,
              ),
              SizedBox(height: 20),
              Text(
                "Suggestions for Improvement",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(height: 20),

              // Suggestions Field
              ValueListenableBuilder<String?>(
                valueListenable: _suggestionsError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText:
                            "Do you have any suggestions to improve the Leadership Academy for future participants?",
                        hintText: 'I like ...',
                        obscureText: false,
                        height: 110,
                        maxLines: 10,
                        controller: suggestionsController,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  "Do you have any suggestions to improve the Leadership Academy for future participants?",
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: Colors.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),

              // Submit Button
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  label: "Submit",
                  height: 40,
                  onPressed: _submitForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioQuestion(
      String question, ValueNotifier<String?> errorNotifier) {
    return ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, error, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRadioQuestion(
              question: question,
              onChanged: (bool? value) {
                ref
                    .read(radioQuestionResponseProvider.notifier)
                    .updateResponse(question, value);
              },
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child: Text(error, style: TextStyle(color: Colors.red)),
              ),
          ],
        );
      },
    );
  }
}
