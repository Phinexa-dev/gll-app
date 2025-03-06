import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
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
  final String eventIdentity;

  const BackgroundInformationScreen({super.key, required this.eventIdentity});

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
  bool? selectedLeadershipProgram;

  final _fullNameError = ValueNotifier<String?>(null);
  final _ageError = ValueNotifier<String?>(null);
  final _countryOriginError = ValueNotifier<String?>(null);
  final _countryResidenceError = ValueNotifier<String?>(null);
  final _statusError = ValueNotifier<String?>(null);
  final _radioError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    ageController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);

    fullNameController.text = surveyResponses['Full name'] ?? '';
    ageController.text = surveyResponses['Age'] ?? '';
    selectedLeadershipProgram = ref.read(radioQuestionResponseProvider)[
        "Have you participated in a leadership program or workshop before?"];

    _updateDropdownSelections(surveyResponses);
  }

  void _updateDropdownSelections(Map<String, String?> surveyResponses) {
    setState(() {
      selectedCountryOrigin = surveyResponses['Country of origin'];
      selectedCountryResidence = surveyResponses['Country of residence'];
      selectedStatus = surveyResponses['Current status'];
    });
  }

  void _submitForm() {
    // Perform custom validation logic here
    bool isValid = true;

    // Validate Full Name
    if (fullNameController.text.isEmpty) {
      _fullNameError.value = 'Please enter your full name';
      isValid = false;
    } else {
      _fullNameError.value = null;
    }

    // Validate Age
    if (ageController.text.isEmpty) {
      _ageError.value = 'Please enter your age';
      isValid = false;
    } else {
      _ageError.value = null;
    }

    // Validate Country of Origin
    if (selectedCountryOrigin == null) {
      _countryOriginError.value = 'Please select your country of origin';
      isValid = false;
    } else {
      _countryOriginError.value = null;
    }

    // Validate Country of Residence
    if (selectedCountryResidence == null) {
      _countryResidenceError.value = 'Please select your country of residence';
      isValid = false;
    } else {
      _countryResidenceError.value = null;
    }

    // Validate Status
    if (selectedStatus == null) {
      _statusError.value = 'Please select your current status';
      isValid = false;
    } else {
      _statusError.value = null;
    }

    if (selectedLeadershipProgram == null) {
      _radioError.value =
          'Please select if you have participated in a leadership program';
      isValid = false;
    } else {
      _radioError.value = null;
    }

    // If the form is valid, go to the next screen
    if (isValid) {
      context.pushNamed(RouteName.goalsExpectationsScreen,
          extra: widget.eventIdentity);
    } else {
      // Optionally show a snackbar or handle invalid form
      print("Form is not valid");
    }
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

              // Full Name Field with custom validation
              ValueListenableBuilder<String?>(
                // Full Name error display
                valueListenable: _fullNameError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 5),

              // Age Field with custom validation
              ValueListenableBuilder<String?>(
                // Age error display
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

              SizedBox(height: 5),

              ValueListenableBuilder<String?>(
                // Country of origin error display
                valueListenable: _countryOriginError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        fieldName: "Country of origin",
                        selectedGender: selectedCountryOrigin,
                        items: countries,
                        hint: "Country",
                        onChanged: (value) {
                          setState(() {
                            selectedCountryOrigin = value;
                          });
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse('Country of origin', value!);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 5),

              ValueListenableBuilder<String?>(
                // Country of residence error display
                valueListenable: _countryResidenceError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        fieldName: "Country of residence",
                        selectedGender: selectedCountryResidence,
                        hint: "Country",
                        items: countries,
                        onChanged: (value) {
                          setState(() {
                            selectedCountryResidence = value;
                          });
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse('Country of residence', value!);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 5),

              ValueListenableBuilder<String?>(
                // Status error display
                valueListenable: _statusError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        fieldName: "Current status",
                        hint: "Status",
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
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse('Current status', value!);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),

              ValueListenableBuilder<String?>(
                // Radio button error display
                valueListenable: _radioError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadioQuestion(
                        question:
                            "Have you participated in a leadership program or workshop before?",
                        onChanged: (bool? value) {
                          setState(() {
                            selectedLeadershipProgram = value;
                          });
                          ref
                              .read(radioQuestionResponseProvider.notifier)
                              .updateResponse(
                                  "Have you participated in a leadership program or workshop before?",
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
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
                      onPressed: _submitForm,
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
