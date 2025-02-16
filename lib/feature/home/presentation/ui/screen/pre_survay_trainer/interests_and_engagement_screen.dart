import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../../../../common/widget/custom_button.dart';
import '../../../../../../common/widget/custom_form_text_field.dart';
import '../../provider/survey_grid_notifier.dart';
import '../../widgets/multi_select_checkbox_widget.dart';

class TTInterestsAndEngagementScreen extends ConsumerStatefulWidget {
  const TTInterestsAndEngagementScreen({super.key});

  @override
  _TTInterestsAndEngagementScreenState createState() =>
      _TTInterestsAndEngagementScreenState();
}

class _TTInterestsAndEngagementScreenState
    extends ConsumerState<TTInterestsAndEngagementScreen> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pre Survey - Train the Trainer',
            style: PhinexaFont.headingSmall),
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
                  "Delivering content with clarity and impact",
                  "Other"
                ],
                onSelectionChanged: (selectedAnswers) {
                  print("Selected Topics: $selectedAnswers");
                },
              ),
              CustomFormTextField(
                hintText: "If there any other mention here..",
                autofocus: true,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText:
                "Are there specific challenges or concerns you have about facilitating workshops or training sessions?",
                hintText: 'I ...',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
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
                onSelectionChanged: (selectedAnswers) {
                  print("Selected Topics: $selectedAnswers");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText:
                "Do you have any accessibility needs or accommodations we should be aware of?",
                hintText: 'I do need ...',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
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
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  label: "Register",
                  height: 40,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
