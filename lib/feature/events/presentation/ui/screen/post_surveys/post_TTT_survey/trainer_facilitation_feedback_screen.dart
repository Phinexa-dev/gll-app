import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../provider/survey_grid_notifier.dart';
import '../../../widgets/custom_square_box_selection_widget.dart';

class TTTTrainerFacilitationFeedbackScreen extends ConsumerStatefulWidget {
  const TTTTrainerFacilitationFeedbackScreen({super.key});

  @override
  _TTTTrainerFacilitationFeedbackScreenState createState() =>
      _TTTTrainerFacilitationFeedbackScreenState();
}

class _TTTTrainerFacilitationFeedbackScreenState
    extends ConsumerState<TTTTrainerFacilitationFeedbackScreen> {
  @override
  void initState() {
    super.initState();
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Trainer Facilitation Feedback",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "For each facilitator, please rate their performance",
                style: PhinexaFont.highlightRegular,
              ),
              SizedBox(
                height: 20,
              ),
              CustomSquareBoxSelectionWidget(
                question: "Credibility and expertise",
                firstGrade: "Disagree",
                lastGrade: "Strongly Agree",
                responses: responses,
                onResponseSelected: (question, value) {
                  print("${question}: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomSquareBoxSelectionWidget(
                question: "Connection with participants",
                firstGrade: "Disagree",
                lastGrade: "Strongly Agree",
                responses: responses,
                onResponseSelected: (question, value) {
                  print("${question}: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomSquareBoxSelectionWidget(
                question: "Ability to manage group conversations effectively",
                firstGrade: "Disagree",
                lastGrade: "Strongly Agree",
                responses: responses,
                onResponseSelected: (question, value) {
                  print("${question}: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomSquareBoxSelectionWidget(
                question: "Knowledge of the content",
                firstGrade: "Disagree",
                lastGrade: "Strongly Agree",
                responses: responses,
                onResponseSelected: (question, value) {
                  print("${question}: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomSquareBoxSelectionWidget(
                question: "Clarity in delivery and presentation",
                firstGrade: "Disagree",
                lastGrade: "Strongly Agree",
                responses: responses,
                onResponseSelected: (question, value) {
                  print("${question}: $value");
                },
              ),
              SizedBox(
                height: 10,
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
                      onPressed: () {
                        context
                            .pushNamed(RouteName.tttApplicationOfSkillsScreen);
                      },
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
