import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../widgets/survey_question_widget.dart';

class LAModuleSpecificFeedbackScreen extends ConsumerStatefulWidget {
  const LAModuleSpecificFeedbackScreen({super.key});

  @override
  _LAModuleSpecificFeedbackScreenState createState() =>
      _LAModuleSpecificFeedbackScreenState();
}

class _LAModuleSpecificFeedbackScreenState
    extends ConsumerState<LAModuleSpecificFeedbackScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                "Module Specific Feedback",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "For each module, please indicate how strongly you agree with the statement:  \"This module was relevant, engaging, and beneficial to youth leadership training.\"",
                style: PhinexaFont.contentRegular,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Day 1",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              SurveyQuestion(
                  question: "Sustainable Development Goals, Vision Trees"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(
                  question:
                      "Leadership 101: Direction, Alignment, and Commitment"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(question: "Perspectives and Mindset"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Day 2",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              SurveyQuestion(question: "Communication & Feedback/SBI"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(question: "Values and Actions"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(question: "Working in Teams"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(question: "Change Happens"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(question: "Sustainable Impact Plan "),
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
                        context.pushNamed(
                            RouteName.laTrainerFacilitationFeedbackScreen);
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
