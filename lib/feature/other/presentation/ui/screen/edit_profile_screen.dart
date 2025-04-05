import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/other/presentation/controller/profile/profile_controller.dart';
import 'package:gll/feature/other/presentation/ui/widget/profile_cover.dart';
import '../../../../../common/widget/custom_icon_button.dart';
import '../../../../../common/widget/custom_text_field.dart';
import '../../../../system_feedback/model/feedback.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  // late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController languagesController;
  late TextEditingController interestsController;

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

    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final formValues = ref.read(profileControllerProvider).form;

    if (!mounted) return; // Prevent updating state if widget is removed

    setState(() {
      nameController.text = formValues?['name'] ?? "";
      // emailController = TextEditingController(text: formValues?['email'] ?? "");
      phoneController.text = formValues?['phoneNumber'] ?? "";
      locationController.text = formValues?['location'] ?? "";
      languagesController.text = formValues?['languages'] ?? "";
      interestsController.text = formValues?['interests'] ?? "";
      phoneCode = formValues?['phoneCode'] ?? "+94";
    });
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

    final formData = {
      'fullName': nameController.text,
      // 'email': emailController.text,
      'dialCode': phoneCode,
      'phoneNumber': phoneController.text,
      'country': locationController.text,
      'languages': languagesController.text,
      'interests': interestsController.text,
    };

    //set the form data to the controller
    ref.read(profileControllerProvider.notifier).setFormData(formData);
    await ref.read(profileControllerProvider.notifier).editProfile();

    final feedBackService = ref.read(feedbackServiceProvider);
    feedBackService.showToast("Successfully edited", type: FeedbackType.success);
  }

  @override
  Widget build(BuildContext context) {

    final isLoading = ref.watch(profileControllerProvider).isLoading;
    final isFailure = ref.watch(profileControllerProvider).isFailure;

    if(isFailure != null && isFailure){
      final feedBackService = ref.read(feedbackServiceProvider);
      final errorMessage = ref.watch(profileControllerProvider).errorMessage;
      // use system feedback to show the error message
      feedBackService.showToast(errorMessage?? "Error occurred", type: FeedbackType.error);
    }

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
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          :
      SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCover(
                editEnabled: true,
              ),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField(label: 'Name',controller: nameController,keyboardType: TextInputType.text),
                    // buildTextField(label: 'Email Address',controller: emailController,keyboardType: TextInputType.emailAddress),
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
                            DropdownMenuItem(value: '+94', alignment: Alignment.center, child: Text('+94'),),
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
                          onPressed: () => saveChanges(),
                          color: Color(0xFF3993A1),
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