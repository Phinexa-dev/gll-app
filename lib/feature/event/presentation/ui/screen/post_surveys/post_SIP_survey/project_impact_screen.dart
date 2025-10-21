import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../../core/route/route_name.dart';
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
    final radioStringResponses = ref.read(radioStringQuestionResponseProvider);
    final textResponses = ref.read(surveyTextFieldResponseProvider);

    if (gridResponses["How would you rate the overall success of your project?"] ==
        null) {
      _successError.value = 'Please rate the project success';
      isValid = false;
      errorMessage += "- Overall success of your project\n";
    } else {
      _successError.value = null;
    }

    if (radioStringResponses["How many people were directly impacted by your project?"] ==
        null) {
      _impactCountError.value = 'Please select an impact range';
      isValid = false;
      errorMessage += "- Number of people directly impacted\n";
    } else {
      _impactCountError.value = null;
    }

    if (radioStringResponses["How many people were directly impacted by your project?"] ==
        "Other" &&
        (textResponses["How many people were directly impacted? Specify"]
            ?.isEmpty ??
            true)) {
      _impactCountError.value = 'Please Specify the range';
      isValid = false;
      errorMessage += "- Please specify the impact count\n";
    } else {
      _impactCountError.value = null;
    }

    if (radioResponses["Did you achieve the goals you set for your project?"] ==
        null) {
      _goalsError.value = 'Please select an option';
      isValid = false;
      errorMessage += "- Achieving project goals\n";
    } else {
      _goalsError.value = null;
    }

    final didAchieve =
    radioResponses["Did you achieve the goals you set for your project?"];
    if (didAchieve == false &&
        (textResponses["If no, what challenges prevented you?"]?.isEmpty ??
            true)) {
      _challengesError.value = 'Please describe the challenges';
      isValid = false;
      errorMessage += "- Challenges preventing goal achievement\n";
    } else {
      _challengesError.value = null;
    }

    if (isValid) {
      context.pushNamed(RouteName.sipLeadershipGrowthScreen);
    } else {
      _showTopSnackBar(context, errorMessage);
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
        title: Text(
          'Post Survey - SIP',
          style: PhinexaFont.highlightAccent,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
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
                const SizedBox(height: 20),
                Text("Project Impact", style: PhinexaFont.headingLarge),
                const SizedBox(height: 20),
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
                        if (ref.watch(
                          surveyTextFieldResponseProvider,
                        )["How many people were directly impacted by your project?"] ==
                            "Other")
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: CustomFormTextField(
                              controller: impactCountController,
                              labelText: 'Specify',
                              hintText: '',
                              obscureText: false,
                              onChanged: (value) {
                                ref
                                    .read(
                                  surveyTextFieldResponseProvider.notifier,
                                )
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
                ValueListenableBuilder<String?>(
                  valueListenable: _challengesError,
                  builder: (context, error, child) {
                    return Visibility(
                      visible: didAchieve == false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFormTextField(
                            labelText:
                            "If not, what challenges prevented you from meeting your goals?",
                            hintText: '',
                            obscureText: false,
                            height: 110,
                            maxLines: 10,
                            controller: challengesController,
                            onChanged: (value) {
                              ref
                                  .read(
                                surveyTextFieldResponseProvider.notifier,
                              )
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