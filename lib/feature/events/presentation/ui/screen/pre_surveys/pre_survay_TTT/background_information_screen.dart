import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../core/data/local/ countries.dart';
import '../../../../../../../core/route/route_name.dart';
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
  String? selectedGender;
  String? selectedCountryOrigin;
  String? selectedCountryResidence;
  String? selectedStatus;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    ageController = TextEditingController();
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Background Information",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 5,
              ),
              CustomFormTextField(
                labelText: 'Full name',
                hintText: 'Full Name',
                controller: fullNameController,
                autofocus: true,
                obscureText: false,
              ),
              SizedBox(
                height: 5,
              ),
              CustomFormTextField(
                labelText: 'Age',
                hintText: 'Age',
                keyboardType: TextInputType.number,
                controller: ageController,
                obscureText: false,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdown(
                fieldName: "What is your gender identity?",
                selectedGender: selectedGender,
                items: [
                  "Male",
                  "Female",
                  "Not listed/Other",
                ],
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdown(
                fieldName: "Country of origin?",
                selectedGender: selectedCountryOrigin,
                items: countries,
                onChanged: (value) {
                  setState(() {
                    selectedCountryOrigin = value;
                  });
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomDropdown(
                fieldName: "Country of residence?",
                selectedGender: selectedCountryResidence,
                items: countries,
                onChanged: (value) {
                  setState(() {
                    selectedCountryResidence = value;
                  });
                },
              ),
              SizedBox(
                height: 5,
              ),
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
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioQuestion(
                question:
                    "Have you participated in a leadership program or workshop before?",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioQuestion(
                question:
                    "Have you facilitated workshops, training sessions, or group activities before?",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              CustomFormTextField(
                labelText: 'If yes, please describe briefly',
                hintText: 'I work ...',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
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
                        context.pushNamed(RouteName.ttGoalsExpectationsScreen);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
