import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../common/widget/custom_form_number_field.dart';
import '../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../core/data/local/user/country_codes.dart';
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
  late TextEditingController ageController;
  late TextEditingController genderDescriptionController;
  String? selectedGender;

  // State for agreement checkboxes
  bool _agreement1Checked = false;
  bool _agreement2Checked = false;

  final _fullNameError = ValueNotifier<String?>(null);
  final _phoneError = ValueNotifier<String?>(null);
  final _ageError = ValueNotifier<String?>(null);
  final _genderError = ValueNotifier<String?>(null);
  final _genderDescriptionError = ValueNotifier<String?>(null);

  // Error notifiers for agreements
  final _agreement1Error = ValueNotifier<bool>(false);
  final _agreement2Error = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    final phoneState = ref.read(phoneNumberProvider);
    final surveyResponses = ref.read(surveyTextFieldResponseProvider);
    _agreement1Checked = surveyResponses['agreement1'] == 'true';
    _agreement2Checked = surveyResponses['agreement2'] == 'true';
    phoneController = TextEditingController(text: phoneState.phoneNumber);
    fullNameController =
        TextEditingController(text: surveyResponses['Full name'] ?? '');
    ageController = TextEditingController(text: surveyResponses['Age'] ?? '');
    genderDescriptionController = TextEditingController(
        text: surveyResponses['Gender Description'] ?? '');
    selectedGender = surveyResponses['Gender'];
  }

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    ageController.dispose();
    genderDescriptionController.dispose();
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

    // Agreement 1 Validation
    if (!_agreement1Checked) {
      _agreement1Error.value = true;
      isValid = false;
      print(isValid);
    }

    // Agreement 2 Validation
    if (!_agreement2Checked) {
      _agreement2Error.value = true;
      isValid = false;
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
                widget.isTTT
                    ? "Train the Trainer Registration"
                    : "Leadership Academy Registration",
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
                        countryCodes: allCountryCodes,
                        selectedCountryCode: phoneState.countryCode,
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
                        selectedValue: selectedGender,
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
              SizedBox(height: 24),
              ValueListenableBuilder<bool>(
                valueListenable: _agreement1Error,
                builder: (context, error, child) {
                  void _toggleAgreement(bool? value) {
                    if (value == null) return;
                    setState(() {
                      _agreement1Checked = value;
                    });
                    if (value) {
                      _agreement1Error.value = false;
                    }
                  }

                  return InkWell(
                    onTap: () => _toggleAgreement(!_agreement1Checked),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1. The Checkbox
                          Checkbox(
                            value: _agreement1Checked,
                            onChanged: _toggleAgreement,
                            checkColor: PhinexaColor.white,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(
                              color: _agreement1Checked
                                  ? PhinexaColor.primaryLightBlue
                                  : PhinexaColor.primaryLightBlue
                                      .withOpacity(0.5),
                              width: 1.0,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text:
                                    'By submitting this LA registration survey, I agree to share my information with local event organizers and partner organizations for the purpose of coordinating and enhancing event participation.',
                                style: PhinexaFont.contentRegular.copyWith(
                                  color: error
                                      ? PhinexaColor.red
                                      : PhinexaColor.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),

              // Agreement 2
              ValueListenableBuilder<bool>(
                valueListenable: _agreement2Error,
                builder: (context, error, child) {
                  void _toggleAgreement2(bool? value) {
                    if (value == null) return;
                    setState(() {
                      _agreement2Checked = value;
                    });
                    if (value) {
                      _agreement2Error.value = false;
                    }
                  }

                  return InkWell(
                    onTap: () => _toggleAgreement2(!_agreement2Checked),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _agreement2Checked,
                            onChanged: _toggleAgreement2,
                            checkColor: PhinexaColor.white,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(
                              color: _agreement2Checked
                                  ? PhinexaColor.primaryLightBlue
                                  : PhinexaColor.primaryLightBlue
                                      .withOpacity(0.5),
                              width: 1.0,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text:
                                    'I hereby grant permission for my image to be used by GL in social media and marketing materials related to the LA event, without expectation of compensation or notification.',
                                style: PhinexaFont.contentRegular.copyWith(
                                  color: error
                                      ? PhinexaColor.red
                                      : PhinexaColor.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
