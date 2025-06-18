import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/other/presentation/controller/profile/profile_controller.dart';
import 'package:gll/feature/other/presentation/ui/widget/profile_cover.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/widget/custom_icon_button.dart';
import '../../../../../common/widget/custom_text_field.dart';
import '../../../../system_feedback/model/feedback.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;

  // late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController languagesController;
  late TextEditingController interestsController;
  late String profileImageUrl;
  File? selectedImage;

  String phoneCode = '+94';

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    // emailController = TextEditingController();
    phoneController = TextEditingController();
    locationController = TextEditingController();
    languagesController = TextEditingController();
    interestsController = TextEditingController();
    profileImageUrl = 'assets/more/mock_user_profile.png';
    selectedImage = null;

    // fetch data needed
    Future.microtask(() {
      _loadUserData();
    });
  }

  Future<void> _loadUserData() async {
    await ref.read(profileControllerProvider.notifier).updateFormData();
    final formValues = ref.read(profileControllerProvider).form;

    if (!mounted) return; // Prevent updating state if widget is removed

    setState(() {
      nameController.text = formValues?['fullName'] ?? "";
      // emailController = TextEditingController(text: formValues?['email'] ?? "");
      phoneController.text = formValues?['Contact Number'] ?? "";
      locationController.text = formValues?['Location'] ?? "";
      languagesController.text = formValues?['Languages'] ?? "";
      interestsController.text = formValues?['Interests'] ?? "";
      phoneCode = formValues?['dialCode'] ?? "";
      profileImageUrl =
          formValues?['profileImage'] ??
              formValues?["gender"]=="male"?
                'assets/more/mock_user_boy_profile.png'
              :
              formValues?["gender"]=="female"?
                'assets/more/mock_user_girl_profile.png'
              :
                'assets/more/mock_user_profile.png';
    });
  }

  // Function to open image picker
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    // emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    languagesController.dispose();
    interestsController.dispose();
    super.dispose();
  }

  void saveChanges() async {
    if (nameController.text.isEmpty ||
        // emailController.text.isEmpty ||
        phoneCode.isEmpty ||
        phoneController.text.isEmpty ||
        locationController.text.isEmpty ||
        languagesController.text.isEmpty ||
        interestsController.text.isEmpty) {
      final feedBackService = ref.read(feedbackServiceProvider);
      feedBackService.showToast("Fill all fields", type: FeedbackType.error);
      return;
    }

    final formData = {
      'fullName': nameController.text,
      // 'email': emailController.text,
      'dialCode': phoneCode,
      'Contact Number': phoneController.text,
      'Location': locationController.text,
      'Languages': languagesController.text,
      'Interests': interestsController.text,
      'profileImageFile': selectedImage,
    };

    //set the form data to the controller
    ref.read(profileControllerProvider.notifier).setFormData(formData);
    await ref.read(profileControllerProvider.notifier).editProfile();

    ref.read(profileControllerProvider.notifier).updateFormData();

    final feedBackService = ref.read(feedbackServiceProvider);
    feedBackService.showToast("Successfully edited",
        type: FeedbackType.success);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(profileControllerProvider).isLoading;
    final isFailure = ref.watch(profileControllerProvider).isFailure;

    if (isFailure != null && isFailure) {
      final feedBackService = ref.read(feedbackServiceProvider);
      final errorMessage = ref.watch(profileControllerProvider).errorMessage;
      // use system feedback to show the error message
      feedBackService.showToast(errorMessage ?? "Error occurred",
          type: FeedbackType.error);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: PhinexaFont.headingESmall,
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCover(
                editEnabled: true,
                onClick: () {
                  _pickImage();
                  // print(selectedImage!.path);
                },
                profileImage: selectedImage != null
                    ? selectedImage!.path
                    : profileImageUrl,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField(
                        label: 'Name',
                        controller: nameController,
                        keyboardType: TextInputType.text),
                    // buildTextField(label: 'Email Address',controller: emailController,keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 16),
                    Text('Phone Number',
                        style: PhinexaFont.labelRegular.copyWith(
                            fontWeight: FontWeight.normal, color: Colors.grey)),
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
                            DropdownMenuItem(
                              value: '+94',
                              alignment: Alignment.center,
                              child: Text('+94'),
                            ),
                            DropdownMenuItem(
                              value: '+91',
                              alignment: Alignment.center,
                              child: Text('+91'),
                            ),
                            DropdownMenuItem(
                              value: '+44',
                              alignment: Alignment.center,
                              child: Text('+44'),
                            ),
                            DropdownMenuItem(
                              value: '+61',
                              alignment: Alignment.center,
                              child: Text('+61'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() => phoneCode = value!);
                          },
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                            child: buildTextField(
                                label: '',
                                controller: phoneController,
                                keyboardType: TextInputType.phone)),
                      ],
                    ),
                    buildTextField(
                        label: 'Location',
                        controller: locationController,
                        keyboardType: TextInputType.text),
                    buildTextField(
                        label: 'Languages',
                        controller: languagesController,
                        keyboardType: TextInputType.text),
                    buildTextField(
                        label: 'Interests',
                        controller: interestsController,
                        keyboardType: TextInputType.text),
                    const SizedBox(height: 24),
                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFF3993A1),
                              strokeWidth: 2,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomIconButton(
                                label: 'Cancel',
                                isBold: true,
                                textColour: Colors.black,
                                onPressed: () => Navigator.pop(context),
                                color: Colors.white,
                                borderColor: Color(0xFF3993A1),
                              ),
                              const SizedBox(width: 16),
                              CustomIconButton(
                                label: 'Save Changes',
                                isBold: true,
                                textColour: Colors.white,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    saveChanges();
                                  }
                                },
                                color: Color(0xFF3993A1),
                                iconColor: Colors.white,
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget buildTextField({
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
            Text(label,
                style: PhinexaFont.labelRegular.copyWith(
                    fontWeight: FontWeight.normal, color: Colors.grey)),
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
