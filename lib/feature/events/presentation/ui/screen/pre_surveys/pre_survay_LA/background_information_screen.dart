import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/events/presentation/ui/widgets/custom_searchable_dropdown.dart';
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
  late TextEditingController marginalizedDescriptionController;
  late TextEditingController statusOtherDescriptionController;

  String? selectedMarginalizedGroup;
  String? selectedGender;
  String? selectedCountryOrigin;
  String? selectedCountryResidence;
  String? selectedStatus;
  bool? selectedLeadershipProgram;

  final _marginalizedError = ValueNotifier<String?>(null);
  final _marginalizedDescriptionError = ValueNotifier<String?>(null);
  final _fullNameError = ValueNotifier<String?>(null);
  final _ageError = ValueNotifier<String?>(null);
  final _countryOriginError = ValueNotifier<String?>(null);
  final _countryResidenceError = ValueNotifier<String?>(null);
  final _statusError = ValueNotifier<String?>(null);
  final _statusOtherDescriptionError = ValueNotifier<String?>(null);
  final _radioError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    ageController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);
    marginalizedDescriptionController = TextEditingController(
        text: surveyResponses['Marginalized Description'] ?? '');
    statusOtherDescriptionController =
        TextEditingController(text: surveyResponses['Status Other'] ?? '');

    selectedMarginalizedGroup = surveyResponses['Marginalized Group'];
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
    bool isValid = true;

    if (fullNameController.text.isEmpty) {
      _fullNameError.value = 'Please enter your full name';
      isValid = false;
    } else {
      _fullNameError.value = null;
    }

    if (ageController.text.isEmpty) {
      _ageError.value = 'Please enter your age';
      isValid = false;
    } else {
      _ageError.value = null;
    }

    if (selectedCountryOrigin == null) {
      _countryOriginError.value = 'Please select your country of origin';
      isValid = false;
    } else {
      _countryOriginError.value = null;
    }

    if (selectedMarginalizedGroup == null) {
      _marginalizedError.value = 'Please select an option';
      isValid = false;
    } else if (selectedMarginalizedGroup == 'Yes' &&
        marginalizedDescriptionController.text.isEmpty) {
      _marginalizedDescriptionError.value = 'Please elaborate';
      isValid = false;
    } else {
      _marginalizedError.value = null;
      _marginalizedDescriptionError.value = null;
    }

    if (selectedCountryResidence == null) {
      _countryResidenceError.value = 'Please select your country of residence';
      isValid = false;
    } else {
      _countryResidenceError.value = null;
    }

    if (selectedStatus == null) {
      _statusError.value = 'Please select your current status';
      isValid = false;
    } else if (selectedStatus == 'Other' &&
        statusOtherDescriptionController.text.isEmpty) {
      _statusOtherDescriptionError.value = 'Please specify your status';
      isValid = false;
    } else {
      _statusError.value = null;
      _statusOtherDescriptionError.value = null;
    }

    if (selectedLeadershipProgram == null) {
      _radioError.value =
          'Please select if you have participated in a leadership program';
      isValid = false;
    } else {
      _radioError.value = null;
    }

    if (isValid) {
      context.pushNamed(RouteName.goalsExpectationsScreen,
          extra: widget.eventIdentity);
    } else {
      print("Form is not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pre-Workshop Survey', style: PhinexaFont.headingSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Tell us a bit about you and your goals before the Leadership Academy begins",
                style: PhinexaFont.labelRegular,
              ),
              SizedBox(height: 20),
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
              ValueListenableBuilder<String?>(
                valueListenable: _countryOriginError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSearchableDropdown(
                        fieldName: "Country of origin",
                        selectedValue: selectedCountryOrigin,
                        items: countries,
                        hintText: 'Country',
                        fieldWidth: double.infinity,
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
                valueListenable: _countryResidenceError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSearchableDropdown(
                        fieldName: "Country of residence",
                        selectedValue: selectedCountryResidence,
                        items: countries,
                        onChanged: (value) {
                          setState(() {
                            selectedCountryResidence = value;
                          });
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse('Country of residence', value!);
                        },
                        hintText: 'Country',
                        fieldWidth: double.infinity,
                      ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 5),
              ValueListenableBuilder<String?>(
                valueListenable: _marginalizedError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        fieldName:
                            "Do you identify as a member of a marginalized group, such as religious or ethnic minority?",
                        hint: "Select an option",
                        selectedValue: selectedMarginalizedGroup,
                        items: ["Yes", "No"],
                        onChanged: (value) {
                          setState(() {
                            selectedMarginalizedGroup = value;
                          });
                          ref
                              .read(surveyTextFieldResponseProvider.notifier)
                              .updateResponse('Marginalized Group', value!);
                        },
                      ),
                      if (selectedMarginalizedGroup == 'Yes')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            CustomFormTextField(
                              labelText: 'Please elaborate',
                              hintText: 'Elaborate here',
                              controller: marginalizedDescriptionController,
                              onChanged: (value) {
                                ref
                                    .read(surveyTextFieldResponseProvider
                                        .notifier)
                                    .updateResponse(
                                        'Marginalized Description', value);
                              },
                              obscureText: false,
                            ),
                            if (_marginalizedDescriptionError.value != null)
                              Text(_marginalizedDescriptionError.value!,
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
              ValueListenableBuilder<String?>(
                valueListenable: _statusError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropdown(
                        fieldName: "Current status",
                        hint: "Status",
                        selectedValue: selectedStatus,
                        items: [
                          "High school student",
                          "College student",
                          "Working professional",
                          "Other"
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
                      if (selectedStatus == 'Other')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            CustomFormTextField(
                              labelText: 'Please specify',
                              hintText: 'Specify your status',
                              controller: statusOtherDescriptionController,
                              onChanged: (value) {
                                ref
                                    .read(surveyTextFieldResponseProvider
                                        .notifier)
                                    .updateResponse('Status Other', value);
                              },
                              obscureText: false,
                            ),
                            if (_statusOtherDescriptionError.value != null)
                              Text(_statusOtherDescriptionError.value!,
                                  style: TextStyle(color: PhinexaColor.red)),
                          ],
                        ),
                      if (error != null)
                        Text(error, style: TextStyle(color: PhinexaColor.red)),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),
              ValueListenableBuilder<String?>(
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
