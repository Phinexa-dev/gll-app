import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/data/local/ countries.dart';
import '../../../../../../../core/route/route_name.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class BackgroundInformationScreen extends ConsumerStatefulWidget {
  const BackgroundInformationScreen({super.key});

  @override
  _BackgroundInformationScreenState createState() =>
      _BackgroundInformationScreenState();
}

class _BackgroundInformationScreenState
    extends ConsumerState<BackgroundInformationScreen> {
  late TextEditingController fullNameController;
  late TextEditingController ageController;
  String? selectedGender;
  String? selectedCountryOrigin;
  String? selectedCountryResidence;
  String? selectedStatus;

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    ageController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    fullNameController.text = surveyResponses['Full name'] ?? '';
    ageController.text = surveyResponses['Age'] ?? '';

    _updateDropdownSelections(surveyResponses);
  }

  void _updateDropdownSelections(Map<String, String?> surveyResponses) {
    setState(() {
      selectedGender = surveyResponses['What is your gender identity'];
      selectedCountryOrigin = surveyResponses['Country of origin'];
      selectedCountryResidence = surveyResponses['Country of residence'];
      selectedStatus = surveyResponses['Current status'];
    });
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
              SizedBox(height: 20),
              Text("Background Information", style: PhinexaFont.headingLarge),
              SizedBox(height: 5),
              CustomFormTextField(
                labelText: 'Full name',
                hintText: 'Full Name',
                controller: fullNameController,
                autofocus: true,
                obscureText: false,
                onChanged: (value) {
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Full name', value);
                },
              ),
              SizedBox(height: 5),
              CustomFormTextField(
                labelText: 'Age',
                hintText: 'Age',
                keyboardType: TextInputType.number,
                controller: ageController,
                obscureText: false,
                onChanged: (value) {
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Age', value);
                },
              ),
              SizedBox(height: 5),
              CustomDropdown(
                fieldName: "What is your gender identity",
                selectedGender: selectedGender,
                items: ["Male", "Female", "Not listed/Other"],
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('What is your gender identity', value!);
                },
              ),
              SizedBox(height: 5),
              CustomDropdown(
                fieldName: "Country of origin",
                selectedGender: selectedCountryOrigin,
                items: countries,
                onChanged: (value) {
                  setState(() {
                    selectedCountryOrigin = value;
                  });
                  // Store the selected value in Riverpod
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Country of origin', value!);
                },
              ),
              SizedBox(height: 5),
              CustomDropdown(
                fieldName: "Country of residence",
                selectedGender: selectedCountryResidence,
                items: countries,
                onChanged: (value) {
                  setState(() {
                    selectedCountryResidence = value;
                  });
                  // Store the selected value in Riverpod
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Country of residence', value!);
                },
              ),
              SizedBox(height: 5),
              CustomDropdown(
                fieldName: "Current status",
                selectedGender: selectedStatus,
                items: [
                  "High school student",
                  "College student",
                  "Working professional"
                ],
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                  // Store the selected value in Riverpod
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Current status', value!);
                },
              ),
              SizedBox(height: 10),
              CustomRadioQuestion(
                question:
                    "Have you participated in a leadership program or workshop before?",
                onChanged: (bool? value) {
                  ref.read(radioQuestionResponseProvider.notifier).updateResponse(
                      "Have you participated in a leadership program or workshop before?",
                      value);
                },
              ),
              SizedBox(height: 10),
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
                        context.pushNamed(RouteName.goalsExpectationsScreen);
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
