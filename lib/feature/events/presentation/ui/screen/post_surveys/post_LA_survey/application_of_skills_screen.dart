import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../../core/route/app_routes.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../system_feedback/model/feedback.dart';
import '../../../../../../bottom_bar/presentation/ui/provider/nav_provider.dart';
import '../../../../../../system_feedback/provider/feedback_provider.dart';
import '../../../../../application/survey_upload_service.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/survey_state_notifier.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class LAApplicationOfSkillsScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const LAApplicationOfSkillsScreen({super.key, required this.eventIdentity});

  @override
  _LAApplicationOfSkillsScreenState createState() =>
      _LAApplicationOfSkillsScreenState();
}

class _LAApplicationOfSkillsScreenState
    extends ConsumerState<LAApplicationOfSkillsScreen> {
  late TextEditingController suggestionsController;

  final _radioErrors = {
    "I can apply the skills gained during the Leadership Academy in my community":
        ValueNotifier<String?>(null),
    "I can use the skills from the program in my future work":
        ValueNotifier<String?>(null),
    "I am interested in contributing to community resilience and sustainability projects":
        ValueNotifier<String?>(null),
    "I am interested in learning how to train others using this program":
        ValueNotifier<String?>(null),
  };

  @override
  void initState() {
    super.initState();
    suggestionsController = TextEditingController(
      text:
          ref.read(
            surveyTextFieldResponseProvider,
          )["Do you have any suggestions to improve the Leadership Academy for future participants?"] ??
          '',
    );
  }

  @override
  void dispose() {
    for (var error in _radioErrors.values) {
      error.dispose();
    }
    suggestionsController.dispose();
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

  Future<void> _submitForm() async {
    bool isValid = true;
    String errorMessage = "The following fields are required:\n";

    final radioResponses = ref.read(radioQuestionResponseProvider);
    for (var question in _radioErrors.keys) {
      if (radioResponses[question] == null) {
        _radioErrors[question]!.value = 'Please answer this question';
        isValid = false;
        errorMessage += "- $question\n";
      } else {
        _radioErrors[question]!.value = null;
      }
    }

    if (isValid) {
      ref.read(isLoadingProvider.notifier).state = true;
      final responses = await combineSurveyResponses(ref);
      await uploadSurveyData(
        ref,
        responses,
        'Post_Survey_${widget.eventIdentity}',
      );
      clearSurveyResponses(ref);

      ref.read(isLoadingProvider.notifier).state = false;
      ref
          .read(feedbackServiceProvider)
          .showToast(
            "Survey submitted successfully",
            type: FeedbackType.success,
          );

      _showCompletionDialog(context);
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
                  style: PhinexaFont.headingSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                CustomButton(
                  label: "Explore",
                  height: 40,
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
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

  Widget _buildRadioQuestion(
    String question,
    ValueNotifier<String?> errorNotifier,
  ) {
    return ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, error, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRadioQuestion(
              question: question,
              onChanged: (bool? value) {
                ref
                    .read(radioQuestionResponseProvider.notifier)
                    .updateResponse(question, value);
              },
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child: Text(error, style: TextStyle(color: Colors.red)),
              ),
          ],
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
        title: Text(
          'Post Survey - Leadership Academy',
          style: PhinexaFont.highlightAccent,
        ),
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
                        "Application of Skills",
                        style: PhinexaFont.headingLarge,
                      ),
                      SizedBox(height: 20),
                      _buildRadioQuestion(
                        "I can apply the skills gained during the Leadership Academy in my community",
                        _radioErrors["I can apply the skills gained during the Leadership Academy in my community"]!,
                      ),
                      SizedBox(height: 10),
                      _buildRadioQuestion(
                        "I can use the skills from the program in my future work",
                        _radioErrors["I can use the skills from the program in my future work"]!,
                      ),
                      SizedBox(height: 10),
                      _buildRadioQuestion(
                        "I am interested in contributing to community resilience and sustainability projects",
                        _radioErrors["I am interested in contributing to community resilience and sustainability projects"]!,
                      ),
                      SizedBox(height: 10),
                      _buildRadioQuestion(
                        "I am interested in learning how to train others using this program",
                        _radioErrors["I am interested in learning how to train others using this program"]!,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Suggestions for Improvement",
                        style: PhinexaFont.headingLarge,
                      ),
                      SizedBox(height: 20),
                      CustomFormTextField(
                        labelText:
                            "Do you have any suggestions to improve the Leadership Academy for future participants?",
                        hintText: '',
                        obscureText: false,
                        height: 110,
                        maxLines: 10,
                        controller: suggestionsController,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                "Do you have any suggestions to improve the Leadership Academy for future participants?",
                                value,
                              );
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: CustomButton(
                          label: "Submit",
                          height: 40,
                          onPressed: _submitForm,
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
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
