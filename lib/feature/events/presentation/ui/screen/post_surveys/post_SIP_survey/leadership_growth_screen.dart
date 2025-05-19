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
  final _supportError = ValueNotifier<String?>(null);
  final _supportDetailsError = ValueNotifier<String?>(null);
  final _suggestionsError = ValueNotifier<String?>(null);
  final _commentsError = ValueNotifier<String?>(null);

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
    _supportError.dispose();
    _supportDetailsError.dispose();
    _suggestionsError.dispose();
    _commentsError.dispose();
    super.dispose();
  }

  void _validateForm() async {
    bool isValid = true;
    final multiSelectResponses = ref.read(surveyMultiSelectResponseProvider);
    final radioResponses = ref.read(radioQuestionResponseProvider);
    final textResponses = ref.read(surveyTextFieldResponseProvider);
    final feedBackService = ref.read(feedbackServiceProvider);

    // Challenges validation
    if (multiSelectResponses[
                "What challenges did you face during your project?"] ==
            null ||
        multiSelectResponses[
                "What challenges did you face during your project?"]!
            .isEmpty) {
      _challengesError.value = 'Please select at least one challenge';
      isValid = false;
    } else {
      _challengesError.value = null;
    }

    // Support validation
    if (radioResponses[
            "Did you receive adequate support from the sponsoring organization or your facilitators?"] ==
        null) {
      _supportError.value = 'Please select an option';
      isValid = false;
    } else {
      _supportError.value = null;
    }

    // Support details validation if answered "No"
    final receivedSupport = radioResponses[
        "Did you receive adequate support from the sponsoring organization or your facilitators?"];
    if (receivedSupport == false &&
        (textResponses["Additional support details"]?.isEmpty ?? true)) {
      _supportDetailsError.value = 'Please specify additional support needed';
      isValid = false;
    } else {
      _supportDetailsError.value = null;
    }

    // Suggestions validation
    if (textResponses["Suggestions for improvement"]?.isEmpty ?? true) {
      _suggestionsError.value = 'Please provide suggestions for improvement';
      isValid = false;
    } else {
      _suggestionsError.value = null;
    }

    // Comments validation
    if (textResponses["Additional comments"]?.isEmpty ?? true) {
      _commentsError.value = 'Please provide any additional comments';
      isValid = false;
    } else {
      _commentsError.value = null;
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

        if (mounted) {
          context.pushNamed(RouteName.createSip);
        }
      } catch (e) {
        feedBackService.showToast("Submission failed: ${e.toString()}",
            type: FeedbackType.error);
      } finally {
        ref.read(isLoadingProvider.notifier).state = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isLoadingProvider);
    final multiSelectResponses = ref.watch(surveyMultiSelectResponseProvider);
    final radioResponses = ref.watch(radioQuestionResponseProvider);
    final receivedSupport = radioResponses[
        "Did you receive adequate support from the sponsoring organization or your facilitators?"];
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

                    // Challenges Multi-Select
                    ValueListenableBuilder<String?>(
                      valueListenable: _challengesError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MultiSelectCheckboxWidget(
                              question:
                                  "What challenges did you face during your project?",
                              answers: [
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
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: ValueListenableBuilder<String?>(
                                  valueListenable: _challengesError,
                                  builder: (context, error, child) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomFormTextField(
                                          controller: challengesOtherController,
                                          hintText:
                                              'Specify other challenges...',
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
                                        if (error != null && hasOtherChallenge)
                                          Text(error,
                                              style: TextStyle(
                                                  color: PhinexaColor.red)),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            if (error != null)
                              Text(error,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 15),

                    // Support Radio
                    ValueListenableBuilder<String?>(
                      valueListenable: _supportError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRadioQuestion(
                              question:
                                  "Did you receive adequate support from the sponsoring organization or your facilitators?",
                              onChanged: (bool? value) {
                                ref
                                    .read(
                                        radioQuestionResponseProvider.notifier)
                                    .updateResponse(
                                        "Did you receive adequate support from the sponsoring organization or your facilitators?",
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

                    // Support Details
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
                                    "If no, what additional support would have been helpful?",
                                hintText: 'We needed...',
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

                    // Suggestions
                    ValueListenableBuilder<String?>(
                      valueListenable: _suggestionsError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFormTextField(
                              controller: suggestionsController,
                              labelText:
                                  "What suggestions do you have for improving the Sustainable Impact Plan experience?",
                              hintText: 'I suggest...',
                              obscureText: false,
                              height: 110,
                              maxLines: 10,
                              onChanged: (value) {
                                ref
                                    .read(surveyTextFieldResponseProvider
                                        .notifier)
                                    .updateResponse(
                                        "Suggestions for improvement", value);
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

                    // Comments
                    ValueListenableBuilder<String?>(
                      valueListenable: _commentsError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFormTextField(
                              controller: commentsController,
                              labelText:
                                  "Do you have any additional comments or feedback?",
                              hintText: 'I would like to share...',
                              obscureText: false,
                              height: 110,
                              maxLines: 10,
                              onChanged: (value) {
                                ref
                                    .read(surveyTextFieldResponseProvider
                                        .notifier)
                                    .updateResponse(
                                        "Additional comments", value);
                              },
                            ),
                            if (error != null)
                              Text(error,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 30),

                    // Submit Button
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

          // Loading overlay
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
