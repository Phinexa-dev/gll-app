import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../provider/survey_grid_notifier.dart';
import '../../../widgets/custom_square_box_selection_widget.dart';

class TTTTrainerFacilitationFeedbackScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const TTTTrainerFacilitationFeedbackScreen({
    super.key,
    required this.eventIdentity,
  });

  @override
  _TTTTrainerFacilitationFeedbackScreenState createState() =>
      _TTTTrainerFacilitationFeedbackScreenState();
}

class _TTTTrainerFacilitationFeedbackScreenState
    extends ConsumerState<TTTTrainerFacilitationFeedbackScreen> {
  // Track errors for each question
  final _questionErrors = {
    "Credibility and expertise": ValueNotifier<String?>(null),
    "Connection with participants": ValueNotifier<String?>(null),
    "Ability to manage group conversations effectively":
        ValueNotifier<String?>(null),
    "Knowledge of the content": ValueNotifier<String?>(null),
    "Clarity in delivery and presentation": ValueNotifier<String?>(null),
  };

  @override
  void dispose() {
    // Dispose all value notifiers
    for (var error in _questionErrors.values) {
      error.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responses = ref.watch(surveyGridResponseProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Flexible(
          child: Text(
            'Post Survey - Train the Trainer',
            style: PhinexaFont.highlightAccent,
            maxLines: 2, // Allow text to break into two lines
            overflow: TextOverflow.ellipsis, // Show '...' if text overflows
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Trainer Facilitation Feedback",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(height: 20),
              Text(
                "For each facilitator, please rate their performance",
                style: PhinexaFont.highlightRegular,
              ),
              SizedBox(height: 20),

              // Question 1
              _buildQuestionWidget(
                "Credibility and expertise",
                responses,
                _questionErrors["Credibility and expertise"]!,
              ),
              SizedBox(height: 10),

              // Question 2
              _buildQuestionWidget(
                "Connection with participants",
                responses,
                _questionErrors["Connection with participants"]!,
              ),
              SizedBox(height: 10),

              // Question 3
              _buildQuestionWidget(
                "Ability to manage group conversations effectively",
                responses,
                _questionErrors[
                    "Ability to manage group conversations effectively"]!,
              ),
              SizedBox(height: 10),

              // Question 4
              _buildQuestionWidget(
                "Knowledge of the content",
                responses,
                _questionErrors["Knowledge of the content"]!,
              ),
              SizedBox(height: 10),

              // Question 5
              _buildQuestionWidget(
                "Clarity in delivery and presentation",
                responses,
                _questionErrors["Clarity in delivery and presentation"]!,
              ),
              SizedBox(height: 10),

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
                      onPressed: () => _validateForm(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionWidget(
    String question,
    Map<String, int?> responses,
    ValueNotifier<String?> errorNotifier,
  ) {
    return ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, error, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSquareBoxSelectionWidget(
              question: question,
              firstGrade: "Disagree",
              lastGrade: "Strongly Agree",
              responses: responses.cast<String, int>(),
              // Cast to Map<String, int>
              onResponseSelected: (question, value) {
                ref
                    .read(surveyGridResponseProvider.notifier)
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

  void _validateForm() {
    bool isValid = true;

    // Validate questions
    final responses = ref.read(surveyGridResponseProvider);
    for (var question in _questionErrors.keys) {
      if (responses[question] == null) {
        _questionErrors[question]!.value = 'Please answer this question';
        isValid = false;
      } else {
        _questionErrors[question]!.value = null;
      }
    }

    if (isValid) {
      context.pushNamed(
        RouteName.tttApplicationOfSkillsScreen,
        extra: widget.eventIdentity,
      );
    }
  }
}
