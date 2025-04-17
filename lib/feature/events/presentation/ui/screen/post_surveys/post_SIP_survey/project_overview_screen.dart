import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../provider/survey_radio_string_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_selection_radio_button_widget.dart';

class SIPProjectOverviewScreen extends ConsumerStatefulWidget {
  const SIPProjectOverviewScreen({super.key});

  @override
  _SIPProjectOverviewScreenState createState() =>
      _SIPProjectOverviewScreenState();
}

class _SIPProjectOverviewScreenState
    extends ConsumerState<SIPProjectOverviewScreen> {
  late TextEditingController otherController;
  late TextEditingController activitiesController;
  late TextEditingController outcomesController;

  final _radioError = ValueNotifier<String?>(null);
  final _otherError = ValueNotifier<String?>(null);
  final _activitiesError = ValueNotifier<String?>(null);
  final _outcomesError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    final textResponses = ref.read(surveyTextFieldResponseProvider);

    otherController = TextEditingController(
      text: textResponses["SIP Focus - Other"] ?? '',
    );
    activitiesController = TextEditingController(
      text: textResponses["Main activities or strategies implemented"] ?? '',
    );
    outcomesController = TextEditingController(
      text: textResponses["Key outcomes or impacts"] ?? '',
    );
  }

  @override
  void dispose() {
    otherController.dispose();
    activitiesController.dispose();
    outcomesController.dispose();
    _radioError.dispose();
    _otherError.dispose();
    _activitiesError.dispose();
    _outcomesError.dispose();
    super.dispose();
  }

  void _validateForm() {
    bool isValid = true;
    final radioResponses = ref.read(radioStringQuestionResponseProvider);
    final textResponses = ref.read(surveyTextFieldResponseProvider);

    // Validate focus selection
    final selectedFocus = radioResponses[
        "What was the focus of your Sustainable Impact Project?"];
    if (selectedFocus == null) {
      _radioError.value = 'Please select a focus area';
      isValid = false;
    } else {
      _radioError.value = null;
    }

    // Validate "Other" field
    if (selectedFocus == "Other" &&
        (textResponses["SIP Focus - Other"]?.isEmpty ?? true)) {
      _otherError.value = 'Please specify your focus area';
      isValid = false;
    } else {
      _otherError.value = null;
    }

    // Validate activities
    if (textResponses[
                "Briefly describe the main activities or strategies you implemented in your  project"]
            ?.isEmpty ??
        true) {
      _activitiesError.value = 'Please describe the main activities';
      isValid = false;
    } else {
      _activitiesError.value = null;
    }

    // Validate outcomes
    if (textResponses["What were the key outcomes or impacts of your project"]
            ?.isEmpty ??
        true) {
      _outcomesError.value = 'Please describe the key outcomes';
      isValid = false;
    } else {
      _outcomesError.value = null;
    }

    if (isValid) {
      context.pushNamed(RouteName.sipSkillsApplicationScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedFocus = ref.watch(radioStringQuestionResponseProvider)[
        "What was the focus of your Sustainable Impact Project"];

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
              Text(
                'Thank you for completing your Sustainable Impact Project (SIP). Your feedback  will help us understand the impact of your project and improve future programs.  This survey is voluntary, and all responses will remain anonymous.',
                style: PhinexaFont.highlightRegular,
              ),
              const SizedBox(height: 20),
              Text("Project Overview", style: PhinexaFont.headingLarge),
              const SizedBox(height: 20),

              // Focus Selection
              ValueListenableBuilder<String?>(
                valueListenable: _radioError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What was the focus of your Sustainable Impact Project?",
                        style: PhinexaFont.contentRegular,
                      ),
                      CustomSelectionRadioButtonWidget(
                        question:
                            "What was the focus of your Sustainable Impact Project?",
                      ),
                      if (error != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child:
                              Text(error, style: TextStyle(color: Colors.red)),
                        ),
                    ],
                  );
                },
              ),

              // Other Text Field
              if (selectedFocus == "Other")
                ValueListenableBuilder<String?>(
                  valueListenable: _otherError,
                  builder: (context, error, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: CustomFormTextField(
                            controller: otherController,
                            hintText: 'SIP',
                            obscureText: false,
                            height: 140,
                            maxLines: 10,
                            onChanged: (value) {
                              ref
                                  .read(
                                      surveyTextFieldResponseProvider.notifier)
                                  .updateResponse("SIP Focus - Other", value);
                            },
                          ),
                        ),
                        if (error != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 4),
                            child: Text(error,
                                style: TextStyle(color: Colors.red)),
                          ),
                      ],
                    );
                  },
                ),

              // Activities Field
              ValueListenableBuilder<String?>(
                valueListenable: _activitiesError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        controller: activitiesController,
                        labelText:
                            "Briefly describe the main activities or strategies you implemented in your  project",
                        hintText: 'We did ...',
                        obscureText: false,
                        height: 110,
                        maxLines: 10,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  "Briefly describe the main activities or strategies you implemented in your  project",
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: Colors.red)),
                    ],
                  );
                },
              ),

              // Outcomes Field
              ValueListenableBuilder<String?>(
                valueListenable: _outcomesError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        controller: outcomesController,
                        labelText:
                            "What were the key outcomes or impacts of your project",
                        hintText: 'We did ...',
                        obscureText: false,
                        height: 110,
                        maxLines: 10,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  "What were the key outcomes or impacts of your project",
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: Colors.red)),
                    ],
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
