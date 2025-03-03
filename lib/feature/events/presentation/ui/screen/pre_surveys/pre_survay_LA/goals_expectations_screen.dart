import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/route/route_name.dart';
import '../../../provider/survey_grid_notifier.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_radio_button_widget.dart';
import '../../../widgets/custom_square_box_selection_widget.dart';

class GoalsExpectationsScreen extends ConsumerStatefulWidget {
  const GoalsExpectationsScreen({super.key});

  @override
  _GoalsExpectationsScreenState createState() =>
      _GoalsExpectationsScreenState();
}

class _GoalsExpectationsScreenState
    extends ConsumerState<GoalsExpectationsScreen> {
  late TextEditingController interestController;
  late TextEditingController skillsController;
  late TextEditingController ledTeam;
  @override
  void initState() {
    super.initState();
    interestController = TextEditingController();
    skillsController = TextEditingController();
    ledTeam = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    interestController.text = surveyResponses[
            'Why are you interested in this leadership workshop?'] ??
        '';
    ledTeam.text = surveyResponses[
            'Have you ever led a team, project, or group activity? If yes, please describe briefly'] ??
        '';
    skillsController.text =
        surveyResponses['What skills or knowledge do you hope to gain?'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final gridResponses = ref.watch(surveyGridResponseProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pre Survey', style: PhinexaFont.headingSmall),
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
                "Goals and Expectations",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 5,
              ),
              CustomFormTextField(
                labelText:
                    'Why are you interested in this leadership workshop?',
                hintText: 'I am ...',
                obscureText: false,
                controller: interestController,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse(
                          'Why are you interested in this leadership workshop?',
                          value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText: 'What skills or knowledge do you hope to gain?',
                hintText: 'Soft skills',
                controller: skillsController,
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse(
                          'What skills or knowledge do you hope to gain?',
                          value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomSquareBoxSelectionWidget(
                question:
                    "How confident are you in your leadership abilities right now?",
                firstGrade: "Not confident",
                lastGrade: "Very confident",
                responses: gridResponses,
                onResponseSelected: (question, value) {
                  ref
                      .read(surveyGridResponseProvider.notifier)
                      .updateResponse(question, value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('Current Skills and Experiences',
                  style: PhinexaFont.headingSmall),
              SizedBox(
                height: 20,
              ),
              CustomRadioQuestion(
                question:
                    "Have you ever led a team, project, or group activity?",
                onChanged: (bool? value) {
                  ref.read(radioQuestionResponseProvider.notifier).updateResponse(
                      "Have you ever led a team, project, or group activity?",
                      value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText: 'If yes, please describe briefly',
                hintText: 'I work ...',
                obscureText: false,
                height: 110,
                controller: ledTeam,
                maxLines: 10,
                onChanged: (value) {
                  ref.read(surveyTextFieldResponseProvider.notifier).updateResponse(
                      'Have you ever led a team, project, or group activity? If yes, please describe briefly',
                      value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomSquareBoxSelectionWidget(
                question: "How comfortable are you with public speaking?",
                firstGrade: "Not comfortable",
                lastGrade: "Very comfortable",
                responses: gridResponses,
                onResponseSelected: (question, value) {
                  ref
                      .read(surveyGridResponseProvider.notifier)
                      .updateResponse(question, value);
                },
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
                            .pushNamed(RouteName.interestsAndEngagementScreen);
                      },
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
}
