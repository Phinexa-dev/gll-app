import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/theme/colors.dart';
import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/data/local/ countries.dart';
import '../../../../../../../core/route/route_name.dart';
import '../../../provider/survey_radio_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class TTBackgroundInformationScreen extends ConsumerStatefulWidget {
  const TTBackgroundInformationScreen({super.key});

  @override
  _TTBackgroundInformationScreenState createState() =>
      _TTBackgroundInformationScreenState();
}

class _TTBackgroundInformationScreenState
    extends ConsumerState<TTBackgroundInformationScreen> {
  late TextEditingController fullNameController;
  late TextEditingController ageController;
  late TextEditingController workshopDescriptionController;

  String? selectedGender;
  String? selectedCountryOrigin;
  String? selectedCountryResidence;
  String? selectedStatus;
  bool? selectedLeadershipProgram;
  bool? selectedFacilitatedWorkshop;

  final _fullNameError = ValueNotifier<String?>(null);
  final _ageError = ValueNotifier<String?>(null);
  final _genderError = ValueNotifier<String?>(null);
  final _countryOriginError = ValueNotifier<String?>(null);
  final _countryResidenceError = ValueNotifier<String?>(null);
  final _statusError = ValueNotifier<String?>(null);
  final _leadershipProgramError = ValueNotifier<String?>(null);
  final _facilitatedWorkshopError = ValueNotifier<String?>(null);
  final _workshopDescriptionError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    ageController = TextEditingController();
    workshopDescriptionController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);
    final radioResponses = ref.read(radioQuestionResponseProvider);

    fullNameController.text = surveyResponses['Full name'] ?? '';
    ageController.text = surveyResponses['Age'] ?? '';
    selectedGender = surveyResponses['What is your gender identity'];
    selectedCountryOrigin = surveyResponses['Country of origin'];
    selectedCountryResidence = surveyResponses['Country of residence'];
    selectedStatus = surveyResponses['Current status'];
    selectedLeadershipProgram = radioResponses[
        "Have you participated in a leadership program or workshop before?"];
    selectedFacilitatedWorkshop = radioResponses[
        "Have you facilitated workshops, training sessions, or group activities before?"];
    workshopDescriptionController.text = surveyResponses[
            'If yes, please describe briefly (facilitated workshops)'] ??
        '';
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
      _genderError.value = 'Please select your gender identity';
      isValid = false;
    } else {
      _genderError.value = null;
    }

    // Country of Origin Validation
    if (selectedCountryOrigin == null) {
      _countryOriginError.value = 'Please select your country of origin';
      isValid = false;
    } else {
      _countryOriginError.value = null;
    }

    // Country of Residence Validation
    if (selectedCountryResidence == null) {
      _countryResidenceError.value = 'Please select your country of residence';
      isValid = false;
    } else {
      _countryResidenceError.value = null;
    }

    // Status Validation
    if (selectedStatus == null) {
      _statusError.value = 'Please select your current status';
      isValid = false;
    } else {
      _statusError.value = null;
    }

    // Leadership Program Validation
    if (selectedLeadershipProgram == null) {
      _leadershipProgramError.value =
          'Please select if you have participated in a leadership program';
      isValid = false;
    } else {
      _leadershipProgramError.value = null;
    }

    // Facilitated Workshop Validation
    if (selectedFacilitatedWorkshop == null) {
      _facilitatedWorkshopError.value =
          'Please select if you have facilitated workshops before';
      isValid = false;
    } else {
      _facilitatedWorkshopError.value = null;
    }

    // Workshop Description Validation (if facilitated workshops is true)
    if (selectedFacilitatedWorkshop == true &&
        workshopDescriptionController.text.isEmpty) {
      _workshopDescriptionError.value = 'Please describe your experience';
      isValid = false;
    } else {
      _workshopDescriptionError.value = null;
    }

    if (isValid) {
      context.pushNamed(RouteName.ttGoalsExpectationsScreen);
    }
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
              SizedBox(height: 20),
              Text("Background Information", style: PhinexaFont.headingLarge),
              SizedBox(height: 5),

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
              SizedBox(height: 5),

              // Gender Dropdown
              ValueListenableBuilder<String?>(
                valueListenable: _genderError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              .updateResponse(
                                  'What is your gender identity', value!);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 5),

              // Country of Origin Dropdown
              ValueListenableBuilder<String?>(
                valueListenable: _countryOriginError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        fieldName: "Country of origin",
                        selectedGender: selectedCountryOrigin,
                        items: countries,
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

              // Country of Residence Dropdown
              ValueListenableBuilder<String?>(
                valueListenable: _countryResidenceError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        fieldName: "Country of residence",
                        selectedGender: selectedCountryResidence,
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

              // Status Dropdown
              ValueListenableBuilder<String?>(
                valueListenable: _statusError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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

              // Leadership Program Radio
              ValueListenableBuilder<String?>(
                valueListenable: _leadershipProgramError,
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

              // Facilitated Workshop Radio
              ValueListenableBuilder<String?>(
                valueListenable: _facilitatedWorkshopError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadioQuestion(
                        question:
                            "Have you facilitated workshops, training sessions, or group activities before?",
                        onChanged: (bool? value) {
                          setState(() {
                            selectedFacilitatedWorkshop = value;
                          });
                          ref
                              .read(radioQuestionResponseProvider.notifier)
                              .updateResponse(
                                  "Have you facilitated workshops, training sessions, or group activities before?",
                                  value);
                        },
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),

              // Workshop Description Field
              ValueListenableBuilder<String?>(
                valueListenable: _workshopDescriptionError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormTextField(
                        labelText: 'If yes, please describe briefly',
                        hintText: 'I work ...',
                        obscureText: false,
                        height: 110,
                        maxLines: 10,
                        controller: workshopDescriptionController,
                        onChanged: (value) {
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse(
                                  'If yes, please describe briefly (facilitated workshops)',
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

              // Next Button
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
                      onPressed: _validateForm,
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
