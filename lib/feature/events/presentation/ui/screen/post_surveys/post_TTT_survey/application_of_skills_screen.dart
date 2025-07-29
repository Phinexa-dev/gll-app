import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/route/app_routes.dart';
import '../../../../../../bottom_bar/presentation/ui/provider/nav_provider.dart'; // Added for navProvider
import '../../../../../../system_feedback/model/feedback.dart';
import '../../../../../../system_feedback/provider/feedback_provider.dart';
import '../../../../../application/survey_upload_service.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/survey_state_notifier.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class TTTApplicationOfSkillsScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const TTTApplicationOfSkillsScreen({
    super.key,
    required this.eventIdentity,
  });

  @override
  _TTTApplicationOfSkillsScreenState createState() =>
      _TTTApplicationOfSkillsScreenState();
}

class _TTTApplicationOfSkillsScreenState
    extends ConsumerState<TTTApplicationOfSkillsScreen> {
  late TextEditingController suggestionsController;

  final _radioErrors = {
    "I feel confident in my ability to facilitate the Leadership Academy modules":
        ValueNotifier<String?>(null),
    "I can effectively use the facilitation skills gained during the workshop":
        ValueNotifier<String?>(null),
    "I am prepared to deliver the Sustainable Impact Plan module":
        ValueNotifier<String?>(null),
    "I am interested in facilitating future Leadership Academy workshops":
        ValueNotifier<String?>(null),
  };

  @override
  void initState() {
    super.initState();
    suggestionsController = TextEditingController(
        text: ref.read(surveyTextFieldResponseProvider)[
                "Do you have any suggestions to improve the Leadership Academy for future participants?"] ??
            '');
  }

  @override
  void dispose() {
    for (var error in _radioErrors.values) {
      error.dispose();
    }
    suggestionsController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    bool isValid = true;

    final radioResponses = ref.read(radioQuestionResponseProvider);
    for (var question in _radioErrors.keys) {
      if (radioResponses[question] == null) {
        _radioErrors[question]!.value = 'Please answer this question';
        isValid = false;
      } else {
        _radioErrors[question]!.value = null;
      }
    }

    // Suggestions field is now optional, no validation here.

    final feedBackService = ref.read(feedbackServiceProvider);

    if (isValid) {
      ref.read(isLoadingProvider.notifier).state = true;
      final responses = await combineSurveyResponses(ref);
      await uploadSurveyData(
          ref, responses, 'Post_Survey_${widget.eventIdentity}');
      clearSurveyResponses(ref);

      ref.read(isLoadingProvider.notifier).state = false;
      feedBackService.showToast("Survey submitted successfully",
          type: FeedbackType.success);

      _showCompletionDialog(context);
    } else {
      print("Form is not valid");
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
                SizedBox(height: 16),
                Text(
                  "Your input is greatly appreciated and helps us enhance future Train the Trainer programs. Click 'Explore' to check out the app.",
                  style: PhinexaFont.contentRegular,
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
        title: Flexible(
          child: Text(
            'Post Survey - Train the Trainer',
            style: PhinexaFont.highlightAccent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
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
                    SizedBox(height: 20),
                    Text(
                      "Application of Skills",
                      style: PhinexaFont.headingLarge,
                    ),
                    SizedBox(height: 20),
                    _buildRadioQuestion(
                      "I feel confident in my ability to facilitate the Leadership Academy modules",
                      _radioErrors[
                          "I feel confident in my ability to facilitate the Leadership Academy modules"]!,
                    ),
                    SizedBox(height: 10),
                    _buildRadioQuestion(
                      "I can effectively use the facilitation skills gained during the workshop",
                      _radioErrors[
                          "I can effectively use the facilitation skills gained during the workshop"]!,
                    ),
                    SizedBox(height: 10),
                    _buildRadioQuestion(
                      "I am prepared to deliver the Sustainable Impact Plan module",
                      _radioErrors[
                          "I am prepared to deliver the Sustainable Impact Plan module"]!,
                    ),
                    SizedBox(height: 10),
                    _buildRadioQuestion(
                      "I am interested in facilitating future Leadership Academy workshops",
                      _radioErrors[
                          "I am interested in facilitating future Leadership Academy workshops"]!,
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
                      hintText: 'Enter your suggestions here...',
                      obscureText: false,
                      height: 110,
                      maxLines: 10,
                      controller: suggestionsController,
                      onChanged: (value) {
                        ref
                            .read(surveyTextFieldResponseProvider.notifier)
                            .updateResponse(
                                "Do you have any suggestions to improve the Leadership Academy for future participants?",
                                value);
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
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRadioQuestion(
      String question, ValueNotifier<String?> errorNotifier) {
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
}
