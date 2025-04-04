import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/theme/colors.dart';
import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/route/route_name.dart';
import '../../../provider/survey_grid_notifier.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_radio_button_widget.dart';
import '../../../widgets/custom_square_box_selection_widget.dart';

class GoalsExpectationsScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const GoalsExpectationsScreen({super.key, required this.eventIdentity});

  @override
  _GoalsExpectationsScreenState createState() =>
      _GoalsExpectationsScreenState();
}

class _GoalsExpectationsScreenState
    extends ConsumerState<GoalsExpectationsScreen> {
  late TextEditingController interestController;
  late TextEditingController skillsController;
  late TextEditingController ledTeamController;

  final _interestError = ValueNotifier<String?>(null);
  final _skillsError = ValueNotifier<String?>(null);
  final _ledTeamError = ValueNotifier<String?>(null);
  final _confidenceError = ValueNotifier<String?>(null);
  final _publicSpeakingError = ValueNotifier<String?>(null);
  final _radioError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    interestController = TextEditingController();
    skillsController = TextEditingController();
    ledTeamController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    interestController.text = surveyResponses[
            'Why are you interested in this leadership workshop?'] ??
        '';
    ledTeamController.text = surveyResponses[
            'Have you ever led a team, project, or group activity? If yes, please describe briefly'] ??
        '';
    skillsController.text =
        surveyResponses['What skills or knowledge do you hope to gain?'] ?? '';
  }

  void _validateForm() {
    bool isValid = true;
    final gridResponses = ref.read(surveyGridResponseProvider);
    final radioResponses = ref.read(radioQuestionResponseProvider);

    // Interest Validation
    if (interestController.text.isEmpty) {
      _interestError.value = 'Please explain your interest';
      isValid = false;
    } else {
      _interestError.value = null;
    }

    // Skills Validation
    if (skillsController.text.isEmpty) {
      _skillsError.value = 'Please describe the skills you hope to gain';
      isValid = false;
    } else {
      _skillsError.value = null;
    }

    // Confidence Validation
    if (gridResponses[
            "How confident are you in your leadership abilities right now?"] ==
        null) {
      _confidenceError.value = 'Please rate your confidence level';
      isValid = false;
    } else {
      _confidenceError.value = null;
    }

    // Radio Button Validation
    if (radioResponses[
            "Have you ever led a team, project, or group activity?"] ==
        null) {
      _radioError.value = 'Please select an option';
      isValid = false;
    } else {
      _radioError.value = null;
    }

    // Led Team Description Validation (if radio is true)
    if (radioResponses[
                "Have you ever led a team, project, or group activity?"] ==
            true &&
        ledTeamController.text.isEmpty) {
      _ledTeamError.value = 'Please describe your experience';
      isValid = false;
    } else {
      _ledTeamError.value = null;
    }

    // Public Speaking Validation
    if (gridResponses["How comfortable are you with public speaking?"] ==
        null) {
      _publicSpeakingError.value = 'Please rate your comfort level';
      isValid = false;
    } else {
      _publicSpeakingError.value = null;
    }

    if (isValid) {
      context.pushNamed(RouteName.interestsAndEngagementScreen,
          extra: widget.eventIdentity);
    }
  }

  @override
  Widget build(BuildContext context) {
    final gridResponses = ref.watch(surveyGridResponseProvider);

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
              Text("Goals and Expectations", style: PhinexaFont.headingLarge),
              SizedBox(height: 5),

              // Interest Field
              ValueListenableBuilder<String?>(
                valueListenable: _interestError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText:
                            'Why are you interested in this leadership workshop?',
                        hintText: 'I am ...',
                        obscureText: false,
                        controller: interestController,
                        height: 110,
                        maxLines: 10,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  'Why are you interested in this leadership workshop?',
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),

              // Skills Field
              ValueListenableBuilder<String?>(
                valueListenable: _skillsError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText:
                            'What skills or knowledge do you hope to gain?',
                        hintText: 'Soft skills',
                        controller: skillsController,
                        obscureText: false,
                        height: 110,
                        maxLines: 10,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  'What skills or knowledge do you hope to gain?',
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),

              // Confidence Grid
              ValueListenableBuilder<String?>(
                valueListenable: _confidenceError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSquareBoxSelectionWidget(
                        question:
                            "How confident are you in your leadership abilities right now?",
                        firstGrade: "Not confident",
                        lastGrade: "Very confident",
                        responses: gridResponses,
                        onResponseSelected: (question, value) {
                          ref
                              .read(surveyGridResponseProvider.notifier)
                              .updateResponse(question, value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),

              Text('Current Skills and Experiences',
                  style: PhinexaFont.headingSmall),
              SizedBox(height: 20),

              // Radio Button
              ValueListenableBuilder<String?>(
                valueListenable: _radioError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadioQuestion(
                        question:
                            "Have you ever led a team, project, or group activity?",
                        onChanged: (bool? value) {
                          ref
                              .read(radioQuestionResponseProvider.notifier)
                              .updateResponse(
                                  "Have you ever led a team, project, or group activity?",
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),

              // Led Team Description
              ValueListenableBuilder<String?>(
                valueListenable: _ledTeamError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText: 'If yes, please describe briefly',
                        hintText: 'I work ...',
                        obscureText: false,
                        height: 110,
                        controller: ledTeamController,
                        maxLines: 10,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  'Have you ever led a team, project, or group activity? If yes, please describe briefly',
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),

              // Public Speaking Grid
              ValueListenableBuilder<String?>(
                valueListenable: _publicSpeakingError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSquareBoxSelectionWidget(
                        question:
                            "How comfortable are you with public speaking?",
                        firstGrade: "Not comfortable",
                        lastGrade: "Very comfortable",
                        responses: gridResponses,
                        onResponseSelected: (question, value) {
                          ref
                              .read(surveyGridResponseProvider.notifier)
                              .updateResponse(question, value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                      width: 100,
                      label: "Next",
                      icon: Icons.chevron_right_rounded,
                      height: 40,
                      onPressed: _validateForm,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
