import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/multi_select_checkbox_widget.dart';

class InterestsAndEngagementScreen extends ConsumerStatefulWidget {
  const InterestsAndEngagementScreen({super.key});

  @override
  _InterestsAndEngagementScreenState createState() =>
      _InterestsAndEngagementScreenState();
}

class _InterestsAndEngagementScreenState
    extends ConsumerState<InterestsAndEngagementScreen> {
  late TextEditingController accessibilityController;
  late TextEditingController knowBeforeController;

  @override
  void initState() {
    super.initState();
    accessibilityController = TextEditingController();
    knowBeforeController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    accessibilityController.text = surveyResponses[
            'Do you have any accessibility needs or accommodations we should be aware of?'] ??
        '';
    knowBeforeController.text = surveyResponses[
            "Is there anything else you'd like us to know before the workshop?"] ??
        '';
  }

  @override
  Widget build(BuildContext context) {
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
                "Interests and Engagement",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              MultiSelectCheckboxWidget(
                question:
                    "What topics are you most excited to explore in this workshop? (Check all that apply)",
                answers: [
                  "Effective Leadership",
                  "UN Sustainable Development Goals",
                  "Communication and Feedback",
                  "Mindset",
                  "Sustainable Impact Projects",
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Logistics and Preferences",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              MultiSelectCheckboxWidget(
                question: "How do you prefer to learn? (Check all that apply)",
                answers: [
                  "Hands-on activities",
                  "Group discussions",
                  "Role-playing scenarios",
                  "Lectures/presentations"
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText:
                    "Do you have any accessibility needs or accommodations we should be aware of?",
                hintText: 'I do need ...',
                obscureText: false,
                controller: accessibilityController,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  ref.read(surveyTextFieldResponseProvider.notifier).updateResponse(
                      'Do you have any accessibility needs or accommodations we should be aware of?',
                      value);
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text('Feedback Opportunity', style: PhinexaFont.headingSmall),
              SizedBox(
                height: 20,
              ),
              CustomFormTextField(
                labelText:
                    "Is there anything else you'd like us to know before the workshop?",
                hintText: 'I work ...',
                controller: knowBeforeController,
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  ref.read(surveyTextFieldResponseProvider.notifier).updateResponse(
                      "Is there anything else you'd like us to know before the workshop?",
                      value);
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  label: "Register",
                  height: 40,
                  onPressed: () {
                    final responses = combineSurveyResponses(
                        ref, "Pre Leadership Academy Workshop Survey");
                    clearSurveyResponses(ref);

                    print(responses);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
