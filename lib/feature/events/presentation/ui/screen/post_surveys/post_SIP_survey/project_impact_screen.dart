import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../provider/survey_grid_notifier.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/survey_radio_string_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_radio_button_widget.dart';
import '../../../widgets/custom_selection_range_radio_widget.dart';
import '../../../widgets/custom_square_box_selection_widget.dart';

class SIPProjectImpactScreen extends ConsumerStatefulWidget {
  const SIPProjectImpactScreen({super.key});

  @override
  _SIPProjectImpactScreenState createState() => _SIPProjectImpactScreenState();
}

class _SIPProjectImpactScreenState
    extends ConsumerState<SIPProjectImpactScreen> {
  late TextEditingController otherBeneficiariesController;
  late TextEditingController impactCountController;
  late TextEditingController challengesController;

  final _successError = ValueNotifier<String?>(null);
  final _impactCountError = ValueNotifier<String?>(null);
  final _goalsError = ValueNotifier<String?>(null);
  final _challengesError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    otherBeneficiariesController = TextEditingController(
      text: surveyResponses["Who benefited from your project? Other"] ?? '',
    );
    impactCountController = TextEditingController(
      text:
          surveyResponses["How many people were directly impacted? Specify"] ??
              '',
    );
    challengesController = TextEditingController(
      text: surveyResponses["If no, what challenges prevented you?"] ?? '',
    );
  }

  @override
  void dispose() {
    otherBeneficiariesController.dispose();
    impactCountController.dispose();
    challengesController.dispose();
    _successError.dispose();
    _impactCountError.dispose();
    _goalsError.dispose();
    _challengesError.dispose();
    super.dispose();
  }

  void _validateForm() {
    bool isValid = true;
    final gridResponses = ref.read(surveyGridResponseProvider);
    final radioResponses = ref.read(radioQuestionResponseProvider);
    final radioStringResponses = ref.read(radioStringQuestionResponseProvider);
    final textResponses = ref.read(surveyTextFieldResponseProvider);

    // Validate project success rating
    if (gridResponses[
            "How would you rate the overall success of your project?"] ==
        null) {
      _successError.value = 'Please rate the project success';
      isValid = false;
    } else {
      _successError.value = null;
    }

    // Validate impact count range
    if (radioStringResponses[
            "How many people were directly impacted by your project?"] ==
        null) {
      _impactCountError.value = 'Please select an impact range';
      isValid = false;
    } else {
      _impactCountError.value = null;
    }

    if (radioStringResponses[
                "How many people were directly impacted by your project?"] ==
            "Other" &&
        (textResponses["How many people were directly impacted? Specify"]
                ?.isEmpty ??
            true)) {
      _impactCountError.value = 'Please Specify the range';
      isValid = false;
    } else {
      _impactCountError.value = null;
    }

    // Validate goals achieved
    if (radioResponses["Did you achieve the goals you set for your project?"] ==
        null) {
      _goalsError.value = 'Please select an option';
      isValid = false;
    } else {
      _goalsError.value = null;
    }

    // Validate challenges if goals not achieved
    final didAchieve =
        radioResponses["Did you achieve the goals you set for your project?"];
    if (didAchieve == false &&
        (textResponses["If no, what challenges prevented you?"]?.isEmpty ??
            true)) {
      _challengesError.value = 'Please describe the challenges';
      isValid = false;
    } else {
      _challengesError.value = null;
    }

    if (isValid) {
      context.pushNamed(RouteName.sipLeadershipGrowthScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final gridResponses = ref.watch(surveyGridResponseProvider);
    final radioResponses = ref.watch(radioQuestionResponseProvider);
    final didAchieve =
        radioResponses["Did you achieve the goals you set for your project?"];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Flexible(
          child: Text(
            'Post Survey - SIP',
            style: PhinexaFont.highlightAccent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Project Impact", style: PhinexaFont.headingLarge),
              const SizedBox(height: 20),

              // Project Success Rating
              ValueListenableBuilder<String?>(
                valueListenable: _successError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSquareBoxSelectionWidget(
                        question:
                            "How would you rate the overall success of your project?",
                        firstGrade: "Low",
                        lastGrade: "High",
                        responses: gridResponses,
                        onResponseSelected: (question, value) {
                          ref
                              .read(surveyGridResponseProvider.notifier)
                              .updateResponse(question, value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: Colors.red)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),

              // Impact Count Range
              ValueListenableBuilder<String?>(
                valueListenable: _impactCountError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How many people were directly impacted by your project?",
                        style: PhinexaFont.contentRegular,
                      ),
                      CustomSelectionRangeRadioWidget(
                        question:
                            "How many people were directly impacted by your project?",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: CustomFormTextField(
                          controller: impactCountController,
                          hintText: '',
                          obscureText: false,
                          onChanged: (value) {
                            ref
                                .read(surveyTextFieldResponseProvider.notifier)
                                .updateResponse(
                                  "How many people were directly impacted? Specify",
                                  value,
                                );
                          },
                        ),
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: Colors.red)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 15),

              // Goals Achieved Radio
              ValueListenableBuilder<String?>(
                valueListenable: _goalsError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadioQuestion(
                        question:
                            "Did you achieve the goals you set for your project?",
                        onChanged: (bool? value) {
                          ref
                              .read(radioQuestionResponseProvider.notifier)
                              .updateResponse(
                                "Did you achieve the goals you set for your project?",
                                value,
                              );
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: Colors.red)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 15),

              // Challenges Field
              ValueListenableBuilder<String?>(
                valueListenable: _challengesError,
                builder: (context, error, child) {
                  return Visibility(
                    visible: didAchieve == false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormTextField(
                          labelText: "If no, what challenges prevented you?",
                          hintText: 'We face ...',
                          obscureText: false,
                          height: 110,
                          maxLines: 10,
                          controller: challengesController,
                          onChanged: (value) {
                            ref
                                .read(surveyTextFieldResponseProvider.notifier)
                                .updateResponse(
                                  "If no, what challenges prevented you?",
                                  value,
                                );
                          },
                        ),
                        if (error != null)
                          Text(error, style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  );
                },
              ),

              // Next Button
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
