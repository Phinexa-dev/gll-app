import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../common/widget/custom_form_number_field.dart';
import '../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../core/route/route_name.dart';
import '../../../../home/presentation/ui/provider/ phone_number_provider.dart';
import '../provider/combine_response.dart';
import '../provider/text_and_dropdown_reponses_provider.dart';
import '../widgets/custom_dropdown.dart';

class RegistrationForm extends ConsumerStatefulWidget {
  final bool isTTT;

  const RegistrationForm({super.key, required this.isTTT});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  late TextEditingController phoneController;
  late TextEditingController fullNameController;
  late TextEditingController ageController;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    final phoneState = ref.read(phoneNumberProvider);

    phoneController = TextEditingController(text: phoneState.phoneNumber);
    fullNameController = TextEditingController();
    ageController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    fullNameController.text = surveyResponses['Full name'] ?? '';
    ageController.text = surveyResponses['Age'] ?? '';
    selectedGender = surveyResponses['What is your gender identity'];
  }

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phoneState = ref.watch(phoneNumberProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Registration', style: PhinexaFont.headingSmall),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: PhinexaColor.black),
          onPressed: () {
            Navigator.pop(context);
            clearSurveyResponses(ref);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Leadership Academy Registration",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(height: 12),
              CustomFormTextField(
                labelText: 'Full name',
                hintText: 'Full Name',
                controller: fullNameController,
                onChanged: (value) {
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Full name', value);
                },
                autofocus: true,
                obscureText: false,
              ),
              SizedBox(height: 12),
              CustomPhoneNumberField(
                controller: phoneController,
                labelText: "Phone Number",
                hintText: "Enter phone number",
                countryCodes: ["+94", "+44", "+11", "+61"],
                selectedCountryCode: phoneState.countryCode,
              ),
              SizedBox(height: 12),
              CustomFormTextField(
                labelText: 'Sponsoring Organization',
                hintText: 'Organization Name',
                onChanged: (value) {
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Sponsoring Organization', value);
                },
                obscureText: false,
              ),
              SizedBox(height: 12),
              CustomFormTextField(
                labelText: 'Region',
                hintText: 'Region',
                obscureText: false,
                onChanged: (value) {
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Region', value);
                },
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 12),
              CustomDropdown(
                fieldName: "Gender",
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
              SizedBox(height: 12),
              CustomFormTextField(
                labelText: 'Education',
                hintText: 'Education',
                obscureText: false,
                onChanged: (value) {
                  ref
                      .read(surveyTextFieldResponseProvider.notifier)
                      .updateResponse('Education', value);
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                label: "Pre Survey",
                height: 40,
                onPressed: () {
                  if (widget.isTTT) {
                    context.pushNamed(RouteName.ttPreSurvey);
                  } else {
                    context.pushNamed(RouteName.preSurvey);
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
