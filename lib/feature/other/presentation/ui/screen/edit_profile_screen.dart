import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/other/presentation/ui/widget/profile_cover.dart';
import '../../../../../common/widget/custom_icon_button.dart';
import '../../../../../common/widget/custom_text_field.dart';

final formProvider = StateProvider((ref) => {
  'name': 'Bryan Cotly',
  'email': 'bcotly@gmail.com',
  'phoneCode': '+01',
  'phoneNumber': '4165551234',
  'location': 'Toronto, Canada',
  'languages': 'English, French',
  'interests': 'Leadership Development, Technology and Innovation in business, Environmental Sustainability Initiatives',
});

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController languagesController;
  late TextEditingController interestsController;

  String phoneCode = '+01';

  @override
  void initState() {
    super.initState();
    final formValues = ref.read(formProvider);
    nameController = TextEditingController(text: formValues['name']);
    emailController = TextEditingController(text: formValues['email']);
    phoneController = TextEditingController(text: formValues['phoneNumber']);
    locationController = TextEditingController(text: formValues['location']);
    languagesController = TextEditingController(text: formValues['languages']);
    interestsController = TextEditingController(text: formValues['interests']);
    phoneCode = formValues['phoneCode']!;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    languagesController.dispose();
    interestsController.dispose();
    super.dispose();
  }

  void saveChanges() {
    final updatedValues = {
      'name': nameController.text,
      'email': emailController.text,
      'phoneCode': phoneCode,
      'phoneNumber': phoneController.text,
      'location': locationController.text,
      'languages': languagesController.text,
      'interests': interestsController.text,
    };

    print(updatedValues);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Edit Profile', style: PhinexaFont.headingESmall,),
              const Row(
                children: [
                  Icon(Icons.share_outlined),
                  SizedBox(width: 15),
                  Icon(Icons.more_vert_outlined),
                ],
              ),
            ],
          )
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCover(),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField(label: 'Name',controller: nameController,keyboardType: TextInputType.text),
                    buildTextField(label: 'Email Address',controller: emailController,keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 16),
                    Text('Phone Number', style:  PhinexaFont.labelRegular.copyWith(fontWeight: FontWeight.normal, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        DropdownButton<String>(
                          borderRadius: BorderRadius.circular(8),
                          alignment: Alignment.center,
                          itemHeight: 60,
                          style: PhinexaFont.labelRegular.copyWith(
                            color: Colors.grey,
                          ),
                          value: phoneCode,
                          items: const [
                            DropdownMenuItem(value: '+01', alignment: Alignment.center, child: Text('+01'),),
                            DropdownMenuItem(value: '+91', alignment: Alignment.center, child: Text('+91'),),
                            DropdownMenuItem(value: '+44', alignment: Alignment.center, child: Text('+44'),),
                            DropdownMenuItem(value: '+61', alignment: Alignment.center, child: Text('+61'),),
                          ],
                          onChanged: (value) {
                            setState(() => phoneCode = value!);
                          },
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: buildTextField(label: '',controller: phoneController,keyboardType: TextInputType.phone)),
                      ],
                    ),
                    buildTextField(label: 'Location', controller: locationController,keyboardType:  TextInputType.text),
                    buildTextField(label: 'Languages', controller: languagesController, keyboardType: TextInputType.text),
                    buildTextField(label: 'Interests', controller: interestsController, keyboardType: TextInputType.text),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomIconButton(
                          label: 'Cancel',
                          textColour: Colors.black,
                          onPressed: () => saveChanges,
                          color: Colors.white,
                          borderColor: Colors.blue,
                        ),
                        const SizedBox(width: 16),
                        CustomIconButton(
                          label: 'Save Changes',
                          textColour: Colors.white,
                          onPressed: () => Navigator.pop(context),
                          color: Colors.blue,
                          iconColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget buildTextField(
      {
        required String label,
        required TextEditingController controller,
        required TextInputType keyboardType,
        String hint = 'required*',
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Text(label, style: PhinexaFont.labelRegular.copyWith(fontWeight: FontWeight.normal, color: Colors.grey)),
          const SizedBox(height: 8),
          CustomTextField(
              labelText: hint,
              controller: controller,
              keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
}