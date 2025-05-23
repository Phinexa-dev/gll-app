import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/route/app_routes.dart';
import '../../../../../../system_feedback/model/feedback.dart';
import '../../../../../../system_feedback/provider/feedback_provider.dart';
import '../../../../../application/survey_upload_service.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/survey_state_notifier.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class LAApplicationOfSkillsScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const LAApplicationOfSkillsScreen({super.key, required this.eventIdentity});

  @override
  _LAApplicationOfSkillsScreenState createState() =>
      _LAApplicationOfSkillsScreenState();
}

class _LAApplicationOfSkillsScreenState
    extends ConsumerState<LAApplicationOfSkillsScreen> {
  late TextEditingController suggestionsController;

  // Track errors for each question
  final _radioErrors = {
    "I can apply the skills gained during the Leadership Academy in my community":
        ValueNotifier<String?>(null),
    "I can use the skills from the program in my future work":
        ValueNotifier<String?>(null),
    "I am interested in contributing to community resilience and sustainability projects":
        ValueNotifier<String?>(null),
    "I am interested in learning how to train others using this program":
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

    final feedBackService = ref.read(feedbackServiceProvider);
    // If the form is valid, navigate to the next screen
    if (isValid) {
      ref.read(isLoadingProvider.notifier).state = true;
      final responses = await combineSurveyResponses(ref);
      await uploadSurveyData(
          ref, responses, 'Post_Survey_${widget.eventIdentity}');
      clearSurveyResponses(ref);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        GoRouter.of(navigationKey.currentContext!).go(RouteName.dashboard);
      });
      ref.read(isLoadingProvider.notifier).state = false;
      feedBackService.showToast("Survey submitted successfully",
          type: FeedbackType.success);
    } else {
      // Optionally show a snackbar or handle invalid form
      print("Form is not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isLoadingProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Post Survey - Leadership Academy',
            style: PhinexaFont.highlightAccent),
      ),
      body: Stack(
        children: [
          AbsorbPointer(
            absorbing: isLoading,
            child: SingleChildScrollView(
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
                      "I can apply the skills gained during the Leadership Academy in my community",
                      _radioErrors[
                          "I can apply the skills gained during the Leadership Academy in my community"]!,
                    ),
                    SizedBox(height: 10),

                    // Question 2
                    _buildRadioQuestion(
                      "I can use the skills from the program in my future work",
                      _radioErrors[
                          "I can use the skills from the program in my future work"]!,
                    ),
                    SizedBox(height: 10),

                    // Question 3
                    _buildRadioQuestion(
                      "I am interested in contributing to community resilience and sustainability projects",
                      _radioErrors[
                          "I am interested in contributing to community resilience and sustainability projects"]!,
                    ),
                    SizedBox(height: 10),

                    // Question 4
                    _buildRadioQuestion(
                      "I am interested in learning how to train others using this program",
                      _radioErrors[
                          "I am interested in learning how to train others using this program"]!,
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
                                    .read(surveyTextFieldResponseProvider
                                        .notifier)
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
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              // Semi-transparent background
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
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
