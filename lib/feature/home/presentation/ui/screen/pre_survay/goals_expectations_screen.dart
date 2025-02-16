import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/home/presentation/ui/widgets/custom_square_box_selection_widget.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../common/widget/custom_button.dart';
import '../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../core/route/route_name.dart';
import '../../provider/survey_grid_notifier.dart';
import '../../widgets/custom_radio_button_widget.dart';

class GoalsExpectationsScreen extends ConsumerStatefulWidget {
  const GoalsExpectationsScreen({super.key});

  @override
  _GoalsExpectationsScreenState createState() =>
      _GoalsExpectationsScreenState();
}

class _GoalsExpectationsScreenState
    extends ConsumerState<GoalsExpectationsScreen> {
  late TextEditingController phoneController;
  late TextEditingController fullNameController;
  late TextEditingController sponsoringOrgController;
  late TextEditingController regionController;
  late TextEditingController ageController;
  late TextEditingController genderController;
  late TextEditingController educationController;
  String? selectedGender;
  String? selectedCountryOrigin;
  String? selectedCountryResidence;
  String? selectedStatus;

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    sponsoringOrgController = TextEditingController();
    regionController = TextEditingController();
    ageController = TextEditingController();
    genderController = TextEditingController();
    educationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final responses = ref.watch(surveyGridResponseProvider);
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
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText: 'What skills or knowledge do you hope to gain?',
                hintText: 'Soft skills',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
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
                responses: responses,
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
                  print("Selected: $value");
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
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomSquareBoxSelectionWidget(
                question: "How comfortable are you with public speaking?",
                firstGrade: "Not comfortable",
                lastGrade: "Very comfortable",
                responses: responses,
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
