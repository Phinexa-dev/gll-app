import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/theme/colors.dart';
import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/route/app_routes.dart';
import '../../../../../../../core/route/route_name.dart';
import '../../../../../application/survey_upload_service.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/multi_select_checkbox_widget.dart';

class InterestsAndEngagementScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const InterestsAndEngagementScreen({super.key, required this.eventIdentity});

  @override
  _InterestsAndEngagementScreenState createState() =>
      _InterestsAndEngagementScreenState();
}

class _InterestsAndEngagementScreenState
    extends ConsumerState<InterestsAndEngagementScreen> {
  late TextEditingController accessibilityController;
  late TextEditingController knowBeforeController;

  final _topicsError = ValueNotifier<String?>(null);
  final _learningPreferenceError = ValueNotifier<String?>(null);
  final _accessibilityError = ValueNotifier<String?>(null);
  final _feedbackError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    accessibilityController = TextEditingController();
    knowBeforeController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    accessibilityController.text = surveyResponses[
            'Do you have any accessibility needs or accommodations we should be aware of?'] ??
        '';
    knowBeforeController.text = surveyResponses[
            "Is there anything else you'd like us to know before the workshop?"] ??
        '';
  }

  void _validateForm() async {
    bool isValid = true;
    final surveyResponses = ref.read(surveyMultiSelectResponseProvider);

    // Topics Validation
    if (surveyResponses[
            "What topics are you most excited to explore in this workshop? (Check all that apply)"] ==
        null) {
      _topicsError.value = 'Please select at least one topic';
      isValid = false;
    } else {
      _topicsError.value = null;
    }

    // Learning Preferences Validation
    if (surveyResponses["How do you prefer to learn? (Check all that apply)"] ==
        null) {
      _learningPreferenceError.value = 'Please select at least one preference';
      isValid = false;
    } else {
      _learningPreferenceError.value = null;
    }

    // Accessibility Validation
    if (accessibilityController.text.isEmpty) {
      _accessibilityError.value =
          'Please let us know about any accessibility needs';
      isValid = false;
    } else {
      _accessibilityError.value = null;
    }

    // Feedback Validation
    if (knowBeforeController.text.isEmpty) {
      _feedbackError.value = 'Please provide any additional feedback';
      isValid = false;
    } else {
      _feedbackError.value = null;
    }

    if (isValid) {
      final responses = await combineSurveyResponses(ref);
      uploadSurveyData(ref, responses, 'Pre_Survey_${widget.eventIdentity}');
      clearSurveyResponses(ref);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        GoRouter.of(navigationKey.currentContext!).go(RouteName.dashboard);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pre Survey', style: PhinexaFont.headingSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Interests and Engagement", style: PhinexaFont.headingLarge),
              SizedBox(height: 20),

              // Topics Multi-Select
              ValueListenableBuilder<String?>(
                valueListenable: _topicsError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MultiSelectCheckboxWidget(
                        question:
                            "What topics are you most excited to explore in this workshop? (Check all that apply)",
                        answers: [
                          "Effective Leadership",
                          "UN Sustainable Development Goals",
                          "Communication and Feedback",
                          "Mindset",
                          "Sustainable Impact Projects",
                        ],
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),
              SizedBox(height: 30),

              Text("Logistics and Preferences",
                  style: PhinexaFont.headingLarge),
              SizedBox(height: 20),

              // Learning Preferences Multi-Select
              ValueListenableBuilder<String?>(
                valueListenable: _learningPreferenceError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MultiSelectCheckboxWidget(
                        question:
                            "How do you prefer to learn? (Check all that apply)",
                        answers: [
                          "Hands-on activities",
                          "Group discussions",
                          "Role-playing scenarios",
                          "Lectures/presentations"
                        ],
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),

              // Accessibility Field
              ValueListenableBuilder<String?>(
                valueListenable: _accessibilityError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText:
                            "Do you have any accessibility needs or accommodations we should be aware of?",
                        hintText: 'I do need ...',
                        obscureText: false,
                        controller: accessibilityController,
                        height: 110,
                        maxLines: 10,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  'Do you have any accessibility needs or accommodations we should be aware of?',
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 30),

              Text('Feedback Opportunity', style: PhinexaFont.headingSmall),
              SizedBox(height: 20),

              // Feedback Field
              ValueListenableBuilder<String?>(
                valueListenable: _feedbackError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText:
                            "Is there anything else you'd like us to know before the workshop?",
                        hintText: 'I work ...',
                        controller: knowBeforeController,
                        obscureText: false,
                        height: 110,
                        maxLines: 10,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  "Is there anything else you'd like us to know before the workshop?",
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  label: "Register",
                  height: 40,
                  onPressed: _validateForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
