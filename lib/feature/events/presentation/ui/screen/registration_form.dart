import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/widget/custom_form_number_field.dart';
import '../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../core/route/route_name.dart';
import '../../../../home/presentation/ui/provider/ phone_number_provider.dart';
import '../widgets/custom_dropdown.dart';

class RegistrationForm extends ConsumerStatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  late TextEditingController phoneController;
  late TextEditingController fullNameController;
  late TextEditingController sponsoringOrgController;
  late TextEditingController regionController;
  late TextEditingController ageController;
  late TextEditingController genderController;
  late TextEditingController educationController;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    final phoneState = ref.read(phoneNumberProvider);

    phoneController = TextEditingController(text: phoneState.phoneNumber);
    fullNameController = TextEditingController();
    sponsoringOrgController = TextEditingController();
    regionController = TextEditingController();
    ageController = TextEditingController();
    genderController = TextEditingController();
    educationController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    fullNameController.dispose();
    sponsoringOrgController.dispose();
    regionController.dispose();
    ageController.dispose();
    genderController.dispose();
    educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phoneState = ref.watch(phoneNumberProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Registration', style: PhinexaFont.headingSmall),
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
                controller: sponsoringOrgController,
                obscureText: false,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 12),
              CustomFormTextField(
                labelText: 'Region',
                hintText: 'Region',
                controller: regionController,
                obscureText: false,
                onChanged: (value) {
                  print(value);
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
                  print(value);
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
                },
              ),
              SizedBox(height: 12),
              CustomFormTextField(
                labelText: 'Education',
                hintText: 'Education',
                controller: educationController,
                obscureText: false,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                label: "Pre Survey",
                height: 40,
                onPressed: () {
                  context.pushNamed(RouteName.sipProjectOverviewScreen);
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   margin: const EdgeInsets.all(20),
      //   child: CustomButton(
      //     label: "Pre Survey",
      //     height: 40,
      //     onPressed: () => {},
      //   ),
      // ),
    );
  }
}
