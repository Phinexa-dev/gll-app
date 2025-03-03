import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class SIPLeadershipGrowthScreen extends ConsumerStatefulWidget {
  const SIPLeadershipGrowthScreen({super.key});

  @override
  _SIPLeadershipGrowthScreenState createState() =>
      _SIPLeadershipGrowthScreenState();
}

class _SIPLeadershipGrowthScreenState
    extends ConsumerState<SIPLeadershipGrowthScreen> {
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
                "Leadership Growth",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              // MultiSelectCheckboxWidget(
              //   question: "What challenges did you face during your project?",
              //   answers: [
              //     "Direction unclear (goal)",
              //     "Alignment poor- responsibility/resources (role)",
              //     "Commitment Insufficient (soul)",
              //     "Poor Communication",
              //     "Unforeseen External Factors (Change)",
              //     "Lack of mentorship support",
              //     "Plan not realistic",
              //     "Deadline too short",
              //     "Other",
              //   ],
              //   onSelectionChanged: (selectedAnswers) {
              //     print("Selected Topics: $selectedAnswers");
              //   },
              // ),
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
                question:
                    "Did you receive adequate support from the sponsoring organization or your  facilitators?",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomFormTextField(
                labelText:
                    "If no, what additional support would have been  helpful?",
                hintText: 'We ...',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 15,
              ),
              // MultiSelectCheckboxWidget(
              //   question:
              //       "Which of the tools and resources provided during the Academy helpful in  executing your project?",
              //   answers: [
              //     "DAC - Direction, Alignment, Commitment",
              //     "Mindset",
              //     "Communication and Feedback",
              //     "Values and Actions",
              //     "Dealing with Change",
              //   ],
              //   onSelectionChanged: (selectedAnswers) {
              //     print("Selected Topics: $selectedAnswers");
              //   },
              // ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Suggestions for Improvement",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormTextField(
                labelText:
                    "What suggestions do you have for improving the Sustainable Impact Plan  experience to better support future projects?",
                hintText: 'I like ...',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomFormTextField(
                labelText:
                    "Do you have any additional comments or feedback for the Leadership  Academy team?",
                hintText: 'I like ...',
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
