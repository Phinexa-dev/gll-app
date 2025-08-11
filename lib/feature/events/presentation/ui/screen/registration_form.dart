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

class RegistrationForm extends ConsumerStatefulWidget {
  final bool isTTT;
  final String eventIdentity;

  const RegistrationForm({
    super.key,
    required this.isTTT,
    required this.eventIdentity,
  });

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  late TextEditingController phoneController;
  late TextEditingController fullNameController;
  late TextEditingController ageController;

  bool _agreement1Checked = false;
  bool _agreement2Checked = false;

  final _fullNameError = ValueNotifier<String?>(null);
  final _phoneError = ValueNotifier<String?>(null);
  final _ageError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    final phoneState = ref.read(phoneNumberProvider);
    final surveyResponses = ref.read(surveyTextFieldResponseProvider);
    _agreement1Checked = surveyResponses['agreement1'] == 'true';
    _agreement2Checked = surveyResponses['agreement2'] == 'true';
    phoneController = TextEditingController(text: phoneState.phoneNumber);
    fullNameController = TextEditingController(
      text: surveyResponses['Full name'] ?? '',
    );
    ageController = TextEditingController(text: surveyResponses['Age'] ?? '');
  }

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void _showTopSnackBar(BuildContext context, String message) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Text(message, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: 3)).then((value) {
      overlayEntry.remove();
    });
  }

  void _validateForm() {
    bool isValid = true;
    String errorMessage = "The following fields are required:\n";

    if (fullNameController.text.isEmpty) {
      _fullNameError.value = 'Please enter your full name';
      isValid = false;
      errorMessage += "- Full name\n";
    } else {
      _fullNameError.value = null;
    }

    if (phoneController.text.isEmpty) {
      _phoneError.value = 'Please enter your phone number';
      isValid = false;
      errorMessage += "- Phone number\n";
    } else {
      _phoneError.value = null;
    }

    if (ageController.text.isEmpty) {
      _ageError.value = 'Please enter your age';
      isValid = false;
      errorMessage += "- Age\n";
    } else if (int.tryParse(ageController.text) == null) {
      _ageError.value = 'Please enter a valid number';
      isValid = false;
      errorMessage += "- Age (must be a number)\n";
    } else {
      _ageError.value = null;
    }

    ref
        .read(surveyTextFieldResponseProvider.notifier)
        .updateResponse(
          'agreement1',
          _agreement1Checked ? "Agreed" : "Not agreed",
        );
    ref
        .read(surveyTextFieldResponseProvider.notifier)
        .updateResponse(
          'agreement2',
          _agreement2Checked ? "Agreed" : "Not agreed",
        );

    if (isValid) {
      if (widget.isTTT) {
        context.pushNamed(RouteName.ttPreSurvey, extra: widget.eventIdentity);
      } else {
        context.pushNamed(RouteName.preSurvey, extra: widget.eventIdentity);
      }
    } else {
      _showTopSnackBar(context, errorMessage);
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 12),
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
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 12),
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
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    setState(() {
                      _agreement1Checked = !_agreement1Checked;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _agreement1Checked,
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              _agreement1Checked = value;
                            });
                          },
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
                                : PhinexaColor.primaryLightBlue.withOpacity(
                                    0.5,
                                  ),
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
                                color: PhinexaColor.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    setState(() {
                      _agreement2Checked = !_agreement2Checked;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _agreement2Checked,
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              _agreement2Checked = value;
                            });
                          },
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
                                : PhinexaColor.primaryLightBlue.withOpacity(
                                    0.5,
                                  ),
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
                                color: PhinexaColor.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
      ),
    );
  }
}
