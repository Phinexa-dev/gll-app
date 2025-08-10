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
import '../../../widgets/custom_searchable_dropdown.dart';

class TTBackgroundInformationScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const TTBackgroundInformationScreen({super.key, required this.eventIdentity});

  @override
  _TTBackgroundInformationScreenState createState() =>
      _TTBackgroundInformationScreenState();
}

class _TTBackgroundInformationScreenState
    extends ConsumerState<TTBackgroundInformationScreen> {
  late TextEditingController fullNameController;
  late TextEditingController ageController;
  late TextEditingController workshopDescriptionController;
  late TextEditingController statusOtherDescriptionController;

  String? selectedCountryOrigin;
  String? selectedCountryResidence;
  String? selectedStatus;
  bool? selectedLeadershipProgram;
  bool? selectedFacilitatedWorkshop;

  final _fullNameError = ValueNotifier<String?>(null);
  final _ageError = ValueNotifier<String?>(null);
  final _countryOriginError = ValueNotifier<String?>(null);
  final _countryResidenceError = ValueNotifier<String?>(null);
  final _statusError = ValueNotifier<String?>(null);
  final _statusOtherDescriptionError = ValueNotifier<String?>(null);
  final _leadershipProgramError = ValueNotifier<String?>(null);
  final _facilitatedWorkshopError = ValueNotifier<String?>(null);
  final _workshopDescriptionError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    ageController = TextEditingController();
    workshopDescriptionController = TextEditingController();
    statusOtherDescriptionController = TextEditingController();

    final surveyResponses = ref.read(surveyTextFieldResponseProvider);
    final radioResponses = ref.read(radioQuestionResponseProvider);

    fullNameController.text = surveyResponses['Full name'] ?? '';
    ageController.text = surveyResponses['Age'] ?? '';
    selectedCountryOrigin = surveyResponses['Country of origin'];
    selectedCountryResidence = surveyResponses['Country of residence'];
    selectedStatus = surveyResponses['Current status'];
    statusOtherDescriptionController.text =
        surveyResponses['Status Other'] ?? '';

    selectedLeadershipProgram =
        radioResponses["Have you participated in a leadership program or workshop before?"];
    selectedFacilitatedWorkshop =
        radioResponses["Have you facilitated workshops, training sessions, or group activities before?"];
    workshopDescriptionController.text =
        surveyResponses['If yes, please describe briefly (facilitated workshops)'] ??
        '';
  }

  @override
  void dispose() {
    fullNameController.dispose();
    ageController.dispose();
    workshopDescriptionController.dispose();
    statusOtherDescriptionController.dispose();
    _fullNameError.dispose();
    _ageError.dispose();
    _countryOriginError.dispose();
    _countryResidenceError.dispose();
    _statusError.dispose();
    _statusOtherDescriptionError.dispose();
    _leadershipProgramError.dispose();
    _facilitatedWorkshopError.dispose();
    _workshopDescriptionError.dispose();
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

    if (selectedCountryOrigin == null) {
      _countryOriginError.value = 'Please select your country of origin';
      isValid = false;
      errorMessage += "- Country of origin\n";
    } else {
      _countryOriginError.value = null;
    }

    if (selectedCountryResidence == null) {
      _countryResidenceError.value = 'Please select your country of residence';
      isValid = false;
      errorMessage += "- Country of residence\n";
    } else {
      _countryResidenceError.value = null;
    }

    if (selectedStatus == null) {
      _statusError.value = 'Please select your current status';
      isValid = false;
      errorMessage += "- Current status\n";
    } else if (selectedStatus == 'Other' &&
        statusOtherDescriptionController.text.isEmpty) {
      _statusOtherDescriptionError.value = 'Please specify your status';
      isValid = false;
      errorMessage += "- Status description\n";
    } else {
      _statusError.value = null;
      _statusOtherDescriptionError.value = null;
    }

    if (selectedLeadershipProgram == null) {
      _leadershipProgramError.value =
          'Please select if you have participated in a leadership program';
      isValid = false;
      errorMessage += "- Leadership program participation\n";
    } else {
      _leadershipProgramError.value = null;
    }

    if (selectedFacilitatedWorkshop == null) {
      _facilitatedWorkshopError.value =
          'Please select if you have facilitated workshops before';
      isValid = false;
      errorMessage += "- Workshop facilitation experience\n";
    } else {
      _facilitatedWorkshopError.value = null;
    }

    if (selectedFacilitatedWorkshop == true &&
        workshopDescriptionController.text.isEmpty) {
      _workshopDescriptionError.value = 'Please describe your experience';
      isValid = false;
      errorMessage += "- Workshop facilitation description\n";
    } else {
      _workshopDescriptionError.value = null;
    }

    if (isValid) {
      context.pushNamed(
        RouteName.ttGoalsExpectationsScreen,
        extra: widget.eventIdentity,
      );
    } else {
      _showTopSnackBar(context, errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final radioResponses = ref.watch(radioQuestionResponseProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Pre Survey - Train the Trainer',
          style: PhinexaFont.contentBold,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text('Background Information', style: PhinexaFont.headingSmall),
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
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
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
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
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
                          hintText: 'Country',
                          fieldWidth: double.infinity,
                          selectedValue: selectedCountryOrigin,
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
                          Text(
                            error,
                            style: TextStyle(color: PhinexaColor.red),
                          ),
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
                          hintText: 'Country',
                          fieldWidth: double.infinity,
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
                SizedBox(height: 5),
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
                          items: const [
                            "High school student",
                            "College student",
                            "Working professional",
                            "Other",
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
                          ValueListenableBuilder<String?>(
                            valueListenable: _statusOtherDescriptionError,
                            builder: (context, otherError, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 12),
                                  CustomFormTextField(
                                    labelText: 'Please specify',
                                    hintText: 'Specify your status',
                                    controller:
                                        statusOtherDescriptionController,
                                    onChanged: (value) {
                                      ref
                                          .read(
                                            surveyTextFieldResponseProvider
                                                .notifier,
                                          )
                                          .updateResponse(
                                            'Status Other',
                                            value,
                                          );
                                    },
                                    obscureText: false,
                                  ),
                                  if (otherError != null)
                                    Text(
                                      otherError,
                                      style: TextStyle(color: PhinexaColor.red),
                                    ),
                                ],
                              );
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
                SizedBox(height: 10),
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
                                  value,
                                );
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
                SizedBox(height: 10),
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
                                  value,
                                );
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
                if (selectedFacilitatedWorkshop == true)
                  ValueListenableBuilder<String?>(
                    valueListenable: _workshopDescriptionError,
                    builder: (context, error, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFormTextField(
                            labelText: 'If yes, please describe briefly',
                            hintText: '',
                            obscureText: false,
                            height: 110,
                            maxLines: 10,
                            controller: workshopDescriptionController,
                            onChanged: (value) {
                              ref
                                  .read(
                                    surveyTextFieldResponseProvider.notifier,
                                  )
                                  .updateResponse(
                                    'If yes, please describe briefly (facilitated workshops)',
                                    value,
                                  );
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
                        onPressed: _validateForm,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
