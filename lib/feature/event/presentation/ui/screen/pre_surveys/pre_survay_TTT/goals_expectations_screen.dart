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

class TTGoalsExpectationsScreen extends ConsumerStatefulWidget {
  final int eventID;

  const TTGoalsExpectationsScreen({super.key, required this.eventID});

  @override
  _TTGoalsExpectationsScreenState createState() =>
      _TTGoalsExpectationsScreenState();
}

class _TTGoalsExpectationsScreenState
    extends ConsumerState<TTGoalsExpectationsScreen> {
  late TextEditingController interestController;
  late TextEditingController skillsController;
  late TextEditingController ledTeamController;

  final _interestError = ValueNotifier<String?>(null);
  final _skillsError = ValueNotifier<String?>(null);
  final _confidenceError = ValueNotifier<String?>(null);
  final _radioError = ValueNotifier<String?>(null);
  final _ledTeamError = ValueNotifier<String?>(null);
  final _publicSpeakingError = ValueNotifier<String?>(null);
  final _engagementError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    interestController = TextEditingController();
    skillsController = TextEditingController();
    ledTeamController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    interestController.text =
        surveyResponses['Why are you interested in this leadership workshop?'] ??
        '';
    skillsController.text =
        surveyResponses['What skills or knowledge do you hope to gain from the Train the Trainer session?'] ??
        '';
    ledTeamController.text =
        surveyResponses['Have you ever led a team, project, or group activity? If yes, please describe briefly'] ??
        '';
  }

  @override
  void dispose() {
    interestController.dispose();
    skillsController.dispose();
    ledTeamController.dispose();
    _interestError.dispose();
    _skillsError.dispose();
    _confidenceError.dispose();
    _radioError.dispose();
    _ledTeamError.dispose();
    _publicSpeakingError.dispose();
    _engagementError.dispose();
    super.dispose();
  }

  void _showTopSnackBar(BuildContext context, String message) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Text(message, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: 3)).then((value) {
      overlayEntry.remove();
    });
  }

  void _validateForm() {
    bool isValid = true;
    String errorMessage = "The following fields are required:\n";

    final gridResponses = ref.read(surveyGridResponseProvider);
    final radioResponses = ref.read(radioQuestionResponseProvider);

    if (interestController.text.isEmpty) {
      _interestError.value = 'Please explain your interest';
      isValid = false;
      errorMessage += "- Why are you interested?\n";
    } else {
      _interestError.value = null;
    }

    if (skillsController.text.isEmpty) {
      _skillsError.value = 'Please describe the skills you hope to gain';
      isValid = false;
      errorMessage += "- What skills do you hope to gain?\n";
    } else {
      _skillsError.value = null;
    }

    if (gridResponses["How confident are you in your ability to lead and facilitate learning experiences right now?"] ==
        null) {
      _confidenceError.value = 'Please rate your confidence level';
      isValid = false;
      errorMessage += "- Leadership confidence level\n";
    } else {
      _confidenceError.value = null;
    }

    if (radioResponses["Have you ever led a team, project, or group activity?"] ==
        null) {
      _radioError.value = 'Please select an option';
      isValid = false;
      errorMessage += "- Have you led a team before?\n";
    } else {
      _radioError.value = null;
    }

    if (radioResponses["Have you ever led a team, project, or group activity?"] ==
            true &&
        ledTeamController.text.isEmpty) {
      _ledTeamError.value = 'Please describe your experience';
      isValid = false;
      errorMessage += "- Please describe your team leadership experience\n";
    } else {
      _ledTeamError.value = null;
    }

    if (gridResponses["How comfortable are you with public speaking?"] ==
        null) {
      _publicSpeakingError.value = 'Please rate your comfort level';
      isValid = false;
      errorMessage += "- Public speaking comfort level\n";
    } else {
      _publicSpeakingError.value = null;
    }

    if (gridResponses["How would you rate your ability to engage and motivate others?"] ==
        null) {
      _engagementError.value = 'Please rate your engagement ability';
      isValid = false;
      errorMessage += "- Engagement and motivation ability\n";
    } else {
      _engagementError.value = null;
    }

    if (isValid) {
      context.pushNamed(
        RouteName.ttInterestsAndEngagementScreen,
        extra: widget.eventID,
      );
    } else {
      _showTopSnackBar(context, errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final responses = ref.watch(surveyGridResponseProvider);
    final radioResponses = ref.watch(radioQuestionResponseProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Pre-Workshop Survey - Train the Trainer',
          style: PhinexaFont.headingSmall,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Goals and Expectations", style: PhinexaFont.headingLarge),
                SizedBox(height: 5),
                ValueListenableBuilder<String?>(
                  valueListenable: _interestError,
                  builder: (context, error, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormTextField(
                          labelText:
                              'Why are you interested in this leadership workshop?',
                          hintText: '',
                          obscureText: false,
                          height: 110,
                          maxLines: 10,
                          controller: interestController,
                          onChanged: (value) {
                            ref
                                .read(surveyTextFieldResponseProvider.notifier)
                                .updateResponse(
                                  'Why are you interested in this leadership workshop?',
                                  value,
                                );
                          },
                        ),
                        if (error != null)
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 10),
                ValueListenableBuilder<String?>(
                  valueListenable: _skillsError,
                  builder: (context, error, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormTextField(
                          customLabelText: Text.rich(
                            TextSpan(
                              text:
                                  'What skills or knowledge do you hope to gain from the ',
                              style: PhinexaFont.contentRegular,
                              children: [
                                TextSpan(
                                  text: 'Train the Trainer',
                                  style: PhinexaFont.contentRegular.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' session?',
                                  style: PhinexaFont.contentRegular,
                                ),
                              ],
                            ),
                          ),
                          hintText: "",
                          obscureText: false,
                          height: 110,
                          maxLines: 10,
                          controller: skillsController,
                          onChanged: (value) {
                            ref
                                .read(surveyTextFieldResponseProvider.notifier)
                                .updateResponse(
                                  'What skills or knowledge do you hope to gain from the Train the Trainer session?',
                                  value,
                                );
                          },
                        ),
                        if (error != null)
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 10),
                ValueListenableBuilder<String?>(
                  valueListenable: _confidenceError,
                  builder: (context, error, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSquareBoxSelectionWidget(
                          question:
                              "How confident are you in your ability to lead and facilitate learning experiences right now?",
                          firstGrade: "Not confident",
                          lastGrade: "Very confident",
                          responses: responses,
                          onResponseSelected: (question, value) {
                            ref
                                .read(surveyGridResponseProvider.notifier)
                                .updateResponse(question, value);
                          },
                        ),
                        if (error != null)
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Current Skills and Experiences',
                  style: PhinexaFont.headingSmall,
                ),
                SizedBox(height: 20),
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
                                  value,
                                );
                          },
                        ),
                        if (error != null)
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 10),
                if (radioResponses["Have you ever led a team, project, or group activity?"] ==
                    true)
                  ValueListenableBuilder<String?>(
                    valueListenable: _ledTeamError,
                    builder: (context, error, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFormTextField(
                            labelText: 'If yes, please describe briefly',
                            hintText: '',
                            obscureText: false,
                            height: 110,
                            maxLines: 10,
                            controller: ledTeamController,
                            onChanged: (value) {
                              ref
                                  .read(
                                    surveyTextFieldResponseProvider.notifier,
                                  )
                                  .updateResponse(
                                    'Have you ever led a team, project, or group activity? If yes, please describe briefly',
                                    value,
                                  );
                            },
                          ),
                          if (error != null)
                            Text(
                              error,
                              style: TextStyle(color: PhinexaColor.red),
                            ),
                        ],
                      );
                    },
                  ),
                SizedBox(height: 10),
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
                          responses: responses,
                          onResponseSelected: (question, value) {
                            ref
                                .read(surveyGridResponseProvider.notifier)
                                .updateResponse(question, value);
                          },
                        ),
                        if (error != null)
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
                      ],
                    );
                  },
                ),
                ValueListenableBuilder<String?>(
                  valueListenable: _engagementError,
                  builder: (context, error, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSquareBoxSelectionWidget(
                          question:
                              "How would you rate your ability to engage and motivate others?",
                          firstGrade: "Need improvements",
                          lastGrade: "Excellent",
                          responses: responses,
                          onResponseSelected: (question, value) {
                            ref
                                .read(surveyGridResponseProvider.notifier)
                                .updateResponse(question, value);
                          },
                        ),
                        if (error != null)
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
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
      ),
    );
  }
}
