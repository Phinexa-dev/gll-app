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
  final String eventIdentity;

  const RegistrationForm(
      {super.key, required this.isTTT, required this.eventIdentity});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  late TextEditingController phoneController;
  late TextEditingController fullNameController;
  late TextEditingController sponsoringOrgController;
  late TextEditingController ageController;
  late TextEditingController educationController;
  late TextEditingController
      genderDescriptionController; // New controller for gender description
  String? selectedGender;

  final _fullNameError = ValueNotifier<String?>(null);
  final _phoneError = ValueNotifier<String?>(null);
  final _sponsoringOrgError = ValueNotifier<String?>(null);
  final _ageError = ValueNotifier<String?>(null);
  final _genderError = ValueNotifier<String?>(null);
  final _educationError = ValueNotifier<String?>(null);
  final _genderDescriptionError =
      ValueNotifier<String?>(null); // New error notifier for gender description

  @override
  void initState() {
    super.initState();
    final phoneState = ref.read(phoneNumberProvider);
    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    phoneController = TextEditingController(text: phoneState.phoneNumber);
    fullNameController =
        TextEditingController(text: surveyResponses['Full name'] ?? '');
    sponsoringOrgController = TextEditingController(
        text: surveyResponses['Sponsoring Organization'] ?? '');
    ageController = TextEditingController(text: surveyResponses['Age'] ?? '');
    educationController =
        TextEditingController(text: surveyResponses['Education'] ?? '');
    genderDescriptionController = TextEditingController(
        text: surveyResponses['Gender Description'] ??
            ''); // Initialize the new controller
    selectedGender = surveyResponses['Gender'];
  }

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    sponsoringOrgController.dispose();
    ageController.dispose();
    educationController.dispose();
    genderDescriptionController.dispose(); // Dispose the new controller
    super.dispose();
  }

  void _validateForm() {
    bool isValid = true;

    // Full Name Validation
    if (fullNameController.text.isEmpty) {
      _fullNameError.value = 'Please enter your full name';
      isValid = false;
    } else {
      _fullNameError.value = null;
    }

    // Phone Validation
    if (phoneController.text.isEmpty) {
      _phoneError.value = 'Please enter your phone number';
      isValid = false;
    } else {
      _phoneError.value = null;
    }

    // Sponsoring Org Validation
    if (sponsoringOrgController.text.isEmpty) {
      _sponsoringOrgError.value = 'Please enter sponsoring organization';
      isValid = false;
    } else {
      _sponsoringOrgError.value = null;
    }

    // Age Validation
    if (ageController.text.isEmpty) {
      _ageError.value = 'Please enter your age';
      isValid = false;
    } else if (int.tryParse(ageController.text) == null) {
      _ageError.value = 'Please enter a valid number';
      isValid = false;
    } else {
      _ageError.value = null;
    }

    // Gender Validation
    if (selectedGender == null) {
      _genderError.value = 'Please select your gender';
      isValid = false;
    } else if (selectedGender == 'Non-binary/Prefer to self-describe' &&
        genderDescriptionController.text.isEmpty) {
      _genderDescriptionError.value = 'Please describe your gender';
      isValid = false;
    } else {
      _genderError.value = null;
      _genderDescriptionError.value = null;
    }

    // Education Validation
    if (educationController.text.isEmpty) {
      _educationError.value = 'Please enter your education';
      isValid = false;
    } else {
      _educationError.value = null;
    }

    if (isValid) {
      if (widget.isTTT) {
        context.pushNamed(RouteName.ttPreSurvey, extra: widget.eventIdentity);
      } else {
        context.pushNamed(RouteName.preSurvey, extra: widget.eventIdentity);
      }
    }
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

              // Full Name Field
              ValueListenableBuilder<String?>(
                valueListenable: _fullNameError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 12),

              // Phone Number Field
              ValueListenableBuilder<String?>(
                valueListenable: _phoneError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPhoneNumberField(
                        controller: phoneController,
                        labelText: "Phone Number",
                        hintText: "Enter phone number",
                        countryCodes: ["+94", "+44", "+11", "+61"],
                        selectedCountryCode: phoneState.countryCode,
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 12),

              // Sponsoring Organization Field
              ValueListenableBuilder<String?>(
                valueListenable: _sponsoringOrgError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText: 'Sponsoring Organization',
                        hintText: 'Organization Name',
                        controller: sponsoringOrgController,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse('Sponsoring Organization', value);
                        },
                        obscureText: false,
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 12),

              // Age Field
              ValueListenableBuilder<String?>(
                valueListenable: _ageError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 12),

              // Gender Dropdown
              ValueListenableBuilder<String?>(
                valueListenable: _genderError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        fieldName: "Gender",
                        hint: "Gender",
                        selectedGender: selectedGender,
                        items: [
                          "Male",
                          "Female",
                          "Non-binary/Prefer to self-describe"
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse('Gender', value!);
                        },
                      ),
                      if (selectedGender ==
                          'Non-binary/Prefer to self-describe')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            CustomFormTextField(
                              labelText: 'Describe your gender',
                              hintText: 'Enter your gender description',
                              controller: genderDescriptionController,
                              onChanged: (value) {
                                ref
                                    .read(surveyTextFieldResponseProvider
                                        .notifier)
                                    .updateResponse(
                                        'Gender Description', value);
                              },
                              obscureText: false,
                            ),
                            if (_genderDescriptionError.value != null)
                              Text(_genderDescriptionError.value!,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 12),

              // Education Field
              ValueListenableBuilder<String?>(
                valueListenable: _educationError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText: 'Education',
                        hintText: 'Education',
                        controller: educationController,
                        obscureText: false,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse('Education', value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 24),

              CustomButton(
                label: "Pre Survey",
                height: 40,
                onPressed: _validateForm,
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
