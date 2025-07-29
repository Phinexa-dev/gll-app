import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/theme/colors.dart';
import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/route/route_name.dart';
import '../../../../../../system_feedback/model/feedback.dart';
import '../../../../../../system_feedback/provider/feedback_provider.dart';
import '../../../../../application/survey_upload_service.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/survey_state_notifier.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_radio_button_widget.dart';
import '../../../widgets/multi_select_checkbox_widget.dart';

class SIPLeadershipGrowthScreen extends ConsumerStatefulWidget {
  const SIPLeadershipGrowthScreen({super.key});

  @override
  _SIPLeadershipGrowthScreenState createState() =>
      _SIPLeadershipGrowthScreenState();
}

class _SIPLeadershipGrowthScreenState
    extends ConsumerState<SIPLeadershipGrowthScreen> {
  late TextEditingController challengesOtherController;
  late TextEditingController supportDetailsController;
  late TextEditingController suggestionsController;
  late TextEditingController commentsController;

  final _challengesError = ValueNotifier<String?>(null);
  final _challengesOtherError = ValueNotifier<String?>(null);
  final _supportError = ValueNotifier<String?>(null);
  final _supportDetailsError = ValueNotifier<String?>(null);
  final _toolsResourcesError = ValueNotifier<String?>(null);

  final String _toolsResourcesQuestion =
      "Which of the tools and resources provided during the Academy helpful in executing your project";
  final List<String> _toolsResourcesOptions = const [
    "DAC – Direction, Alignment, Commitment",
    "Mindset",
    "Communication and Feedback",
    "Values and Actions",
    "Dealing with Change",
  ];

  @override
  void initState() {
    super.initState();
    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    challengesOtherController = TextEditingController(
      text: surveyResponses["Challenges - Other"] ?? '',
    );
    supportDetailsController = TextEditingController(
      text: surveyResponses["Additional support details"] ?? '',
    );
    suggestionsController = TextEditingController(
      text: surveyResponses["Suggestions for improvement"] ?? '',
    );
    commentsController = TextEditingController(
      text: surveyResponses["Additional comments"] ?? '',
    );
  }

  @override
  void dispose() {
    challengesOtherController.dispose();
    supportDetailsController.dispose();
    suggestionsController.dispose();
    commentsController.dispose();
    _challengesError.dispose();
    _challengesOtherError.dispose();
    _supportError.dispose();
    _supportDetailsError.dispose();
    _toolsResourcesError.dispose();
    super.dispose();
  }

  void _validateForm() async {
    bool isValid = true;
    final multiSelectResponses = ref.read(surveyMultiSelectResponseProvider);
    final radioResponses = ref.read(radioQuestionResponseProvider);
    final feedBackService = ref.read(feedbackServiceProvider);

    final selectedToolsResources =
        multiSelectResponses[_toolsResourcesQuestion] as List?;
    if (selectedToolsResources == null || selectedToolsResources.isEmpty) {
      _toolsResourcesError.value =
          'Please select at least one tool or resource';
      isValid = false;
    } else {
      _toolsResourcesError.value = null;
    }

    final selectedChallenges = multiSelectResponses[
        "What challenges did you face during your project?"] as List?;
    if (selectedChallenges == null || selectedChallenges.isEmpty) {
      _challengesError.value = 'Please select at least one challenge';
      isValid = false;
    } else {
      _challengesError.value = null;
      if (selectedChallenges.contains("Other") &&
          (challengesOtherController.text.trim().isEmpty)) {
        _challengesOtherError.value = 'Please specify other challenges';
        isValid = false;
      } else {
        _challengesOtherError.value = null;
      }
    }

    if (radioResponses[
            "Did you receive adequate support from the sponsoring organization or your mentors?"] ==
        null) {
      _supportError.value = 'Please select an option';
      isValid = false;
    } else {
      _supportError.value = null;
    }

    final receivedSupport = radioResponses[
        "Did you receive adequate support from the sponsoring organization or your mentors?"];
    if (receivedSupport == false &&
        (supportDetailsController.text.trim().isEmpty)) {
      _supportDetailsError.value = 'Please specify additional support needed';
      isValid = false;
    } else {
      _supportDetailsError.value = null;
    }

    if (isValid) {
      try {
        ref.read(isLoadingProvider.notifier).state = true;
        final date = DateTime.now();
        final formattedDate =
            '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
        final fileName = 'Post_Survey_SIP_$formattedDate';
        final responses = await combineSurveyResponses(ref);
        await uploadSurveyData(ref, responses, fileName);

        feedBackService.showToast("Survey submitted successfully",
            type: FeedbackType.success);

        _showCompletionDialog(context);
      } catch (e) {
        feedBackService.showToast("Submission failed: ${e.toString()}",
            type: FeedbackType.error);
      } finally {
        ref.read(isLoadingProvider.notifier).state = false;
      }
    }
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thank you for completing this survey',
                  style: PhinexaFont.headingSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "Great job on your project! Now, let's upload your Sustainable Impact Plan. This is your chance to showcase all your hard work and inspire others.",
                  style: PhinexaFont.contentRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  label: "Upload Your SIP",
                  height: 40,
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    context.go(RouteName.createSip);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isLoadingProvider);
    final multiSelectResponses = ref.watch(surveyMultiSelectResponseProvider);
    final radioResponses = ref.watch(radioQuestionResponseProvider);
    final receivedSupport = radioResponses[
        "Did you receive adequate support from the sponsoring organization or your mentors?"];
    final hasOtherChallenge = multiSelectResponses[
                "What challenges did you face during your project?"]
            ?.contains("Other") ??
        false;

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
                    const SizedBox(height: 20),
                    Text("Leadership Growth", style: PhinexaFont.headingLarge),
                    const SizedBox(height: 20),
                    ValueListenableBuilder<String?>(
                      valueListenable: _challengesError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MultiSelectCheckboxWidget(
                              question:
                                  "What challenges did you face during your project?",
                              answers: const [
                                "Direction unclear (goal)",
                                "Alignment poor- responsibility/resources (role)",
                                "Commitment Insufficient (soul)",
                                "Poor Communication",
                                "Unforeseen External Factors (Change)",
                                "Lack of mentorship support",
                                "Plan not realistic",
                                "Deadline too short",
                                "Other",
                              ],
                            ),
                            if (hasOtherChallenge)
                              ValueListenableBuilder<String?>(
                                valueListenable: _challengesOtherError,
                                builder: (context, otherError, child) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomFormTextField(
                                          controller: challengesOtherController,
                                          hintText: '',
                                          obscureText: false,
                                          onChanged: (value) {
                                            ref
                                                .read(
                                                    surveyTextFieldResponseProvider
                                                        .notifier)
                                                .updateResponse(
                                                    "Challenges - Other",
                                                    value);
                                          },
                                        ),
                                        if (otherError != null)
                                          Text(otherError,
                                              style: TextStyle(
                                                  color: PhinexaColor.red)),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            if (error != null && !hasOtherChallenge)
                              Text(error,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    ValueListenableBuilder<String?>(
                      valueListenable: _supportError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRadioQuestion(
                              question:
                                  "Did you receive adequate support from the sponsoring organization or your mentors?",
                              onChanged: (bool? value) {
                                ref
                                    .read(
                                        radioQuestionResponseProvider.notifier)
                                    .updateResponse(
                                        "Did you receive adequate support from the sponsoring organization or your mentors?",
                                        value);
                              },
                            ),
                            if (error != null)
                              Text(error,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    ValueListenableBuilder<String?>(
                      valueListenable: _supportDetailsError,
                      builder: (context, error, child) {
                        return Visibility(
                          visible: receivedSupport == false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFormTextField(
                                controller: supportDetailsController,
                                labelText:
                                    "If not, what additional support would have been helpful?",
                                hintText: '',
                                obscureText: false,
                                height: 110,
                                maxLines: 10,
                                onChanged: (value) {
                                  ref
                                      .read(surveyTextFieldResponseProvider
                                          .notifier)
                                      .updateResponse(
                                          "Additional support details", value);
                                },
                              ),
                              if (error != null)
                                Text(error,
                                    style: TextStyle(color: PhinexaColor.red)),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    ValueListenableBuilder<String?>(
                      valueListenable: _toolsResourcesError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MultiSelectCheckboxWidget(
                              question: _toolsResourcesQuestion,
                              answers: _toolsResourcesOptions,
                            ),
                            if (error != null)
                              Text(error,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text("Suggestions for Improvement",
                        style: PhinexaFont.headingLarge),
                    const SizedBox(height: 20),
                    CustomFormTextField(
                      controller: suggestionsController,
                      labelText:
                          "What suggestions do you have for improving the Sustainable Impact Project experience?",
                      hintText: '',
                      obscureText: false,
                      height: 110,
                      maxLines: 10,
                      onChanged: (value) {
                        ref
                            .read(surveyTextFieldResponseProvider.notifier)
                            .updateResponse(
                                "Suggestions for improvement", value);
                      },
                    ),
                    const SizedBox(height: 15),
                    Text("Additional Comments ",
                        style: PhinexaFont.headingLarge),
                    const SizedBox(height: 20),
                    CustomFormTextField(
                      controller: commentsController,
                      labelText:
                          "Do you have any additional comments or feedback?",
                      hintText: '',
                      obscureText: false,
                      height: 110,
                      maxLines: 10,
                      onChanged: (value) {
                        ref
                            .read(surveyTextFieldResponseProvider.notifier)
                            .updateResponse("Additional comments", value);
                      },
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: CustomButton(
                        label: "Submit Survey",
                        height: 40,
                        onPressed: _validateForm,
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
              child: Center(
                child: CircularProgressIndicator(
                  color: PhinexaColor.primaryLightBlue,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
