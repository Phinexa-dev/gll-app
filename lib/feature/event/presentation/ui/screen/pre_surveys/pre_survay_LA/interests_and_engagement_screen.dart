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
import '../../../../controller/event/event_controller.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/survey_state_notifier.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/multi_select_checkbox_widget.dart';

class InterestsAndEngagementScreen extends ConsumerStatefulWidget {
  final int eventID;

  const InterestsAndEngagementScreen({super.key, required this.eventID});

  @override
  _InterestsAndEngagementScreenState createState() =>
      _InterestsAndEngagementScreenState();
}

class _InterestsAndEngagementScreenState
    extends ConsumerState<InterestsAndEngagementScreen> {
  late TextEditingController accessibilityController;
  late TextEditingController knowBeforeController;
  late TextEditingController learningPreferenceOtherController;

  final ValueNotifier<String?> _topicsError = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _learningPreferenceError =
      ValueNotifier<String?>(null);
  final ValueNotifier<String?> _learningPreferenceOtherError =
      ValueNotifier<String?>(null);
  final ValueNotifier<String?> _accessibilityError = ValueNotifier<String?>(
    null,
  );

  @override
  void initState() {
    super.initState();
    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    accessibilityController = TextEditingController(
      text:
          surveyResponses['Do you have any accessibility needs or accommodations we should be aware of?'] ??
          '',
    );
    knowBeforeController = TextEditingController(
      text:
          surveyResponses["Is there anything else you'd like us to know before the workshop?"] ??
          '',
    );
    learningPreferenceOtherController = TextEditingController(
      text: surveyResponses['Learning Preference Other'] ?? '',
    );
  }

  @override
  void dispose() {
    accessibilityController.dispose();
    knowBeforeController.dispose();
    learningPreferenceOtherController.dispose();
    _topicsError.dispose();
    _learningPreferenceError.dispose();
    _learningPreferenceOtherError.dispose();
    _accessibilityError.dispose();
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

  void _validateForm() async {
    bool isValid = true;
    String errorMessage = "The following fields are required:\n";

    final surveyMultiSelectResponses = ref.read(
      surveyMultiSelectResponseProvider,
    );

    if (surveyMultiSelectResponses["What topics are you most interested in exploring in this workshop? (Check all that apply)"] ==
            null ||
        (surveyMultiSelectResponses["What topics are you most interested in exploring in this workshop? (Check all that apply)"]
                as List)
            .isEmpty) {
      _topicsError.value = 'Please select at least one topic';
      isValid = false;
      errorMessage += "- Topics of interest\n";
    } else {
      _topicsError.value = null;
    }

    final learningPreferences =
        surveyMultiSelectResponses["How do you prefer to learn? (Check all that apply)"]
            as List?;

    if (learningPreferences == null || learningPreferences.isEmpty) {
      _learningPreferenceError.value = 'Please select at least one preference';
      isValid = false;
      errorMessage += "- Learning preference\n";
    } else {
      if (learningPreferences.contains('Other') &&
          learningPreferenceOtherController.text.trim().isEmpty) {
        _learningPreferenceOtherError.value =
            'Please elaborate on your learning preference';
        isValid = false;
        errorMessage += "- Other learning preference elaboration\n";
      } else {
        _learningPreferenceOtherError.value = null;
      }
      _learningPreferenceError.value = null;
    }

    if (accessibilityController.text.isEmpty) {
      _accessibilityError.value =
          'Please let us know about any accessibility needs';
      isValid = false;
      errorMessage += "- Accessibility needs\n";
    } else {
      _accessibilityError.value = null;
    }

    if (isValid) {
      try {
        final responses = await formatSurveyForAPI(ref);
        await uploadPreSurveyData(ref, responses, widget.eventID);

        clearSurveyResponses(ref);

        if (mounted) {
          ref.read(feedbackServiceProvider).showToast(
            "Survey submitted successfully",
            type: FeedbackType.success,
          );
          _showCompletionDialog(context);
        }
      } catch (error) {
        if (mounted) {
          ref.read(feedbackServiceProvider).showToast(
            "Failed to submit survey. Please try again.",
            type: FeedbackType.error,
          );
        }
      }
    } else {
      _showTopSnackBar(context, errorMessage);
    }
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Thank you for completing this survey',
                  style: PhinexaFont.headingSmall.copyWith(
                    color: PhinexaColor.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  "You're officially registered to GL2i Leadership Academy, high fives all around! While you wait for the Leadership Academy to kick off, take a look around the app",
                  style: PhinexaFont.contentRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                CustomButton(
                  label: "Explore",
                  height: 40,
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    ref.read(eventControllerProvider.notifier).getEvents();
                    ref.read(navProvider.notifier).onItemTapped(0);
                    GoRouter.of(
                      navigationKey.currentContext!,
                    ).go(RouteName.dashboard);
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
    final isLoading = ref.watch(surveySubmissionStateProvider).isLoading;
    final surveyMultiSelectResponses = ref.watch(
      surveyMultiSelectResponseProvider,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pre-Workshop Survey', style: PhinexaFont.headingSmall),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
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
                        "Interests and Engagement",
                        style: PhinexaFont.headingLarge,
                      ),
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
                                  "Not sure/Don\'t know",
                                ],
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
                      SizedBox(height: 30),
                      Text(
                        "Logistics and Preferences",
                        style: PhinexaFont.headingLarge,
                      ),
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
                                  "Other",
                                ],
                              ),
                              if (surveyMultiSelectResponses["How do you prefer to learn? (Check all that apply)"]
                                      ?.contains('Other') ??
                                  false)
                                ValueListenableBuilder<String?>(
                                  valueListenable:
                                      _learningPreferenceOtherError,
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
                                                      .notifier,
                                                )
                                                .updateResponse(
                                                  'Learning Preference Other',
                                                  value,
                                                );
                                          },
                                          obscureText: false,
                                        ),
                                        if (otherError != null)
                                          Text(
                                            otherError,
                                            style: TextStyle(
                                              color: PhinexaColor.red,
                                            ),
                                          ),
                                      ],
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
                                controller: accessibilityController,
                                height: 110,
                                maxLines: 10,
                                onChanged: (value) {
                                  ref
                                      .read(
                                        surveyTextFieldResponseProvider
                                            .notifier,
                                      )
                                      .updateResponse(
                                        'Do you have any accessibility needs or accommodations we should be aware of?',
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
                      SizedBox(height: 30),
                      Text(
                        'Feedback Opportunity',
                        style: PhinexaFont.headingSmall,
                      ),
                      SizedBox(height: 20),
                      CustomFormTextField(
                        labelText:
                            "Is there anything else you'd like us to know before the workshop?",
                        hintText: '',
                        controller: knowBeforeController,
                        obscureText: false,
                        height: 110,
                        maxLines: 10,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                "Is there anything else you'd like us to know before the workshop?",
                                value,
                              );
                        },
                      ),
                      SizedBox(height: 20),
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
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
