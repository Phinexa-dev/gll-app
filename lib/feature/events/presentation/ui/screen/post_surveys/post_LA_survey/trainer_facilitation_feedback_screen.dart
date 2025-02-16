import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../home/presentation/ui/provider/survey_grid_notifier.dart';
import '../../../widgets/custom_square_box_selection_widget.dart';

class LATrainerFacilitationFeedbackScreen extends ConsumerStatefulWidget {
  const LATrainerFacilitationFeedbackScreen({super.key});

  @override
  _LATrainerFacilitationFeedbackScreenState createState() =>
      _LATrainerFacilitationFeedbackScreenState();
}

class _LATrainerFacilitationFeedbackScreenState
    extends ConsumerState<LATrainerFacilitationFeedbackScreen> {
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
        title: Text('Post Leadership Academy Survey',
            style: PhinexaFont.highlightAccent),
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
                style: PhinexaFont.contentRegular,
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
                            .pushNamed(RouteName.laApplicationOfSkillsScreen);
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
