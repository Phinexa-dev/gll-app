import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/theme/colors.dart';
import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/route/app_routes.dart';
import '../../../../../../../core/route/route_name.dart';
import '../../../../../../bottom_bar/presentation/ui/provider/nav_provider.dart';
import '../../../../../../system_feedback/model/feedback.dart';
import '../../../../../../system_feedback/provider/feedback_provider.dart';
import '../../../../../application/survey_upload_service.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/survey_state_notifier.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/multi_select_checkbox_widget.dart';

class TTInterestsAndEngagementScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const TTInterestsAndEngagementScreen(
      {super.key, required this.eventIdentity});

  @override
  _TTInterestsAndEngagementScreenState createState() =>
      _TTInterestsAndEngagementScreenState();
}

class _TTInterestsAndEngagementScreenState
    extends ConsumerState<TTInterestsAndEngagementScreen> {
  late TextEditingController otherTopicsController;
  late TextEditingController challengesController;
  late TextEditingController accessibilityController;
  late TextEditingController feedbackController;
  late TextEditingController learningPreferenceOtherController;

  final _topicsError = ValueNotifier<String?>(null);
  final _otherTopicsError = ValueNotifier<String?>(null);
  final _challengesError = ValueNotifier<String?>(null);
  final _learningPreferenceError = ValueNotifier<String?>(null);
  final _learningPreferenceOtherError = ValueNotifier<String?>(null);
  final _accessibilityError = ValueNotifier<String?>(null);

  // Removed _feedbackError as the field is now optional

  @override
  void initState() {
    super.initState();
    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    otherTopicsController = TextEditingController(
        text: surveyResponses['If there any other mention here..'] ?? '');
    challengesController = TextEditingController(
        text: surveyResponses[
                'Are there specific challenges or concerns you have about facilitating workshops or training sessions?'] ??
            '');
    accessibilityController = TextEditingController(
        text: surveyResponses[
                'Do you have any accessibility needs or accommodations we should be aware of?'] ??
            '');
    // Removed initial text for feedbackController
    feedbackController = TextEditingController(
        text: surveyResponses[
                "Is there anything else you'd like us to know before the workshop?"] ??
            '');
    learningPreferenceOtherController = TextEditingController(
        text: surveyResponses['Learning Preference Other TT'] ??
            ''); // New key for TT
  }

  @override
  void dispose() {
    otherTopicsController.dispose();
    challengesController.dispose();
    accessibilityController.dispose();
    feedbackController.dispose();
    learningPreferenceOtherController.dispose();

    _topicsError.dispose();
    _otherTopicsError.dispose();
    _challengesError.dispose();
    _learningPreferenceError.dispose();
    _learningPreferenceOtherError.dispose();
    _accessibilityError.dispose();
    // _feedbackError.dispose(); // No longer needed
    super.dispose();
  }

  Future<void> _validateForm() async {
    bool isValid = true;
    final surveyMultiSelectResponses =
        ref.read(surveyMultiSelectResponseProvider);

    // Topics Validation
    final selectedTopics = surveyMultiSelectResponses[
            "What topics are you most interested in exploring in this workshop? (Check all that apply)"]
        as List?;

    if (selectedTopics == null || selectedTopics.isEmpty) {
      _topicsError.value = 'Please select at least one topic';
      isValid = false;
    } else {
      _topicsError.value = null;
      // Other Topics Validation (only if 'Other' is selected)
      if (selectedTopics.contains("Other") &&
          otherTopicsController.text.trim().isEmpty) {
        _otherTopicsError.value = 'Please mention any other topics';
        isValid = false;
      } else {
        _otherTopicsError.value = null;
      }
    }

    // Challenges Validation
    if (challengesController.text.isEmpty) {
      _challengesError.value =
          'Please describe any challenges or concerns you have';
      isValid = false;
    } else {
      _challengesError.value = null;
    }

    // Learning Preferences Validation
    final learningPreferences = surveyMultiSelectResponses[
        "How do you prefer to learn? (Check all that apply)"] as List?;

    if (learningPreferences == null || learningPreferences.isEmpty) {
      _learningPreferenceError.value = 'Please select at least one preference';
      isValid = false;
    } else {
      if (learningPreferences.contains('Other') &&
          learningPreferenceOtherController.text.trim().isEmpty) {
        _learningPreferenceOtherError.value =
            'Please elaborate on your learning preference';
        isValid = false;
      } else {
        _learningPreferenceOtherError.value = null;
      }
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

    // Feedback field is now optional, no validation here
    // _feedbackError.value = null; // Ensure no error is shown if it was previously set

    final feedBackService = ref.read(feedbackServiceProvider);
    if (isValid) {
      ref.read(isLoadingProvider.notifier).state = true;
      final responses = await combineSurveyResponses(ref);
      await uploadSurveyData(
          ref, responses, 'Pre_Survey_${widget.eventIdentity}');
      clearSurveyResponses(ref);

      ref.read(isLoadingProvider.notifier).state = false;
      feedBackService.showToast("Survey submitted successfully",
          type: FeedbackType.success);

      _showCompletionDialog(context);
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
                  style: PhinexaFont.headingSmall
                      .copyWith(color: PhinexaColor.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                CustomButton(
                  label: "Explore",
                  height: 40,
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    ref.read(navProvider.notifier).onItemTapped(2);
                    GoRouter.of(navigationKey.currentContext!)
                        .go(RouteName.dashboard);
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pre-Workshop Survey - Train the Trainer',
            style: PhinexaFont.headingSmall),
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
                    Text("Interests and Engagement",
                        style: PhinexaFont.headingLarge),
                    SizedBox(height: 20),
                    ValueListenableBuilder<String?>(
                      valueListenable: _topicsError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MultiSelectCheckboxWidget(
                              question:
                                  "What topics are you most interested in exploring in this workshop? (Check all that apply)",
                              answers: const [
                                "Effective Leadership",
                                "UN Sustainable Development Goals",
                                "Communication and Feedback",
                                "Mindset",
                                "Sustainable Impact Projects",
                                "Delivering content with clarity and impact",
                                "Not sure/Don’t know",
                                "Other"
                              ],
                            ),
                            if (error != null)
                              Text(error,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        );
                      },
                    ),
                    // Conditionally display Other Topics Field
                    if (ref
                            .watch(surveyMultiSelectResponseProvider)[
                                "What topics are you most interested in exploring in this workshop? (Check all that apply)"]
                            ?.contains("Other") ??
                        false)
                      ValueListenableBuilder<String?>(
                        valueListenable: _otherTopicsError,
                        builder: (context, error, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomFormTextField(
                                hintText: "Other topic(s)",
                                autofocus: false,
                                // Changed to false as it's not the first field
                                obscureText: false,
                                controller: otherTopicsController,
                                onChanged: (value) {
                                  ref
                                      .read(surveyTextFieldResponseProvider
                                          .notifier)
                                      .updateResponse(
                                          'If there any other mention here..',
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
                    SizedBox(height: 10),
                    ValueListenableBuilder<String?>(
                      valueListenable: _challengesError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFormTextField(
                              labelText:
                                  "Are there specific challenges or concerns you have about facilitating workshops or training sessions?",
                              hintText: '',
                              obscureText: false,
                              height: 110,
                              maxLines: 10,
                              controller: challengesController,
                              onChanged: (value) {
                                ref
                                    .read(surveyTextFieldResponseProvider
                                        .notifier)
                                    .updateResponse(
                                        'Are there specific challenges or concerns you have about facilitating workshops or training sessions?',
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
                    SizedBox(height: 30),
                    Text("Logistics and Preferences",
                        style: PhinexaFont.headingLarge),
                    SizedBox(height: 20),
                    ValueListenableBuilder<String?>(
                      valueListenable: _learningPreferenceError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MultiSelectCheckboxWidget(
                              question:
                                  "How do you prefer to learn? (Check all that apply)",
                              answers: const [
                                "Hands-on activities",
                                "Group discussions",
                                "Role-playing scenarios",
                                "Lectures/presentations",
                                "Other" // Added 'Other' option
                              ],
                            ),
                            if (ref
                                    .watch(surveyMultiSelectResponseProvider)[
                                        "How do you prefer to learn? (Check all that apply)"]
                                    ?.contains('Other') ??
                                false)
                              ValueListenableBuilder<String?>(
                                valueListenable: _learningPreferenceOtherError,
                                builder: (context, otherError, child) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 12),
                                      CustomFormTextField(
                                        labelText: 'Please elaborate',
                                        hintText: 'Elaborate here',
                                        controller:
                                            learningPreferenceOtherController,
                                        onChanged: (value) {
                                          ref
                                              .read(
                                                  surveyTextFieldResponseProvider
                                                      .notifier)
                                              .updateResponse(
                                                  'Learning Preference Other TT',
                                                  value); // Use new key
                                        },
                                        obscureText: false,
                                      ),
                                      if (otherError != null)
                                        Text(otherError,
                                            style: TextStyle(
                                                color: PhinexaColor.red)),
                                    ],
                                  );
                                },
                              ),
                            if (error != null)
                              Text(error,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    ValueListenableBuilder<String?>(
                      valueListenable: _accessibilityError,
                      builder: (context, error, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFormTextField(
                              labelText:
                                  "Do you have any accessibility needs or accommodations we should be aware of?",
                              hintText: '',
                              obscureText: false,
                              height: 110,
                              maxLines: 10,
                              controller: accessibilityController,
                              onChanged: (value) {
                                ref
                                    .read(surveyTextFieldResponseProvider
                                        .notifier)
                                    .updateResponse(
                                        'Do you have any accessibility needs or accommodations we should be aware of?',
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
                    SizedBox(height: 30),
                    Text('Feedback Opportunity',
                        style: PhinexaFont.headingSmall),
                    SizedBox(height: 20),
                    CustomFormTextField(
                      labelText:
                          "Is there anything else you'd like us to know before the workshop?",
                      hintText: '',
                      // Updated hint text
                      obscureText: false,
                      height: 110,
                      maxLines: 10,
                      controller: feedbackController,
                      onChanged: (value) {
                        ref
                            .read(surveyTextFieldResponseProvider.notifier)
                            .updateResponse(
                                "Is there anything else you'd like us to know before the workshop?",
                                value);
                      },
                    ),
                    SizedBox(height: 20),
                    // The 'Thank you' text is moved to the pop-up, so removed from here.
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
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
