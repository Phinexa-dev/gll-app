import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../home/presentation/ui/provider/survey_grid_notifier.dart';
import '../../../widgets/custom_radio_button_widget.dart';
import '../../../widgets/custom_selection_range_radio_widget.dart';
import '../../../widgets/custom_square_box_selection_widget.dart';
import '../../../widgets/multi_select_checkbox_widget.dart';

class SIPProjectImpactScreen extends ConsumerStatefulWidget {
  const SIPProjectImpactScreen({super.key});

  @override
  _SIPProjectImpactScreenState createState() => _SIPProjectImpactScreenState();
}

class _SIPProjectImpactScreenState
    extends ConsumerState<SIPProjectImpactScreen> {
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
            'Post Survey - SIP',
            style: PhinexaFont.highlightAccent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
                "Project Impact",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              CustomSquareBoxSelectionWidget(
                question:
                    "How would you rate the overall success of your project?",
                firstGrade: "Low",
                lastGrade: "High",
                responses: responses,
                onResponseSelected: (question, value) {
                  print("${question}: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              MultiSelectCheckboxWidget(
                question: "Who benefited from your project?",
                answers: [
                  "Local community members",
                  "Schools or educational institutions",
                  "Youth groups or peers",
                  "Environmental organizations",
                  "Other",
                ],
                onSelectionChanged: (selectedAnswers) {
                  print("Selected Topics: $selectedAnswers");
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: CustomFormTextField(
                  hintText: '',
                  obscureText: false,
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "How many people were directly impacted by your project?",
                style: PhinexaFont.contentRegular,
              ),
              CustomSelectionRangeRadioWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: CustomFormTextField(
                  hintText: '',
                  obscureText: false,
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomRadioQuestion(
                question: "Did you achieve the goals you set for your project?",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomFormTextField(
                labelText: "If no, what challenges prevented you?",
                hintText: 'We face ...',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
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
                        context.pushNamed(RouteName.sipLeadershipGrowthScreen);
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
