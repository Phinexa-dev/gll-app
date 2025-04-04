import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/feature/other/presentation/controller/profile/profile_controller.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../common/widget/custom_icon_button.dart';
import '../../../../../system_feedback/model/feedback.dart';
import '../../../../../system_feedback/provider/feedback_provider.dart';

final mockSocialProvider = StateProvider((ref) => {
  'personalBlog': 'https://www.bryancotly.com',
  'facebook': 'https://www.facebook.com/bcotly',
  'linkedIn': 'https://www.linkedin.com/in/bcotly',
  'instagram': 'https://www.instagram.com/bcotly',
  'x': 'https://www.x.com',
});

class EditSocials extends ConsumerStatefulWidget {
  const EditSocials({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditSocialsState();
}

class _EditSocialsState extends ConsumerState<EditSocials> {
  final TextEditingController personalBlogUrlController = TextEditingController();
  final TextEditingController facebookUrlController = TextEditingController();
  final TextEditingController linkedInUrlController = TextEditingController();
  final TextEditingController instagramUrlController = TextEditingController();
  final TextEditingController xUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final formValues = ref.read(mockSocialProvider);
    personalBlogUrlController.text = formValues['personalBlog']!;
    facebookUrlController.text = formValues['facebook']!;
    linkedInUrlController.text = formValues['linkedIn']!;
    instagramUrlController.text = formValues['instagram']!;
    xUrlController.text = formValues['x']!;
  }

  @override
  void dispose() {
    personalBlogUrlController.dispose();
    facebookUrlController.dispose();
    linkedInUrlController.dispose();
    instagramUrlController.dispose();
    xUrlController.dispose();
    super.dispose();
  }

  void saveChanges() {

    final formData = {
      'facebook': facebookUrlController.text,
      'blog': personalBlogUrlController.text,
      'instagram': instagramUrlController.text,
      'x': xUrlController.text,
      'twitter': linkedInUrlController.text,
    };

    //set the form data to the controller
    ref.read(profileControllerProvider.notifier).setFormData(formData);
    ref.read(profileControllerProvider.notifier).editSocials();
    context.pop();
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

    return FractionallySizedBox(
      heightFactor: 0.65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Socials',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(labelText: 'Personal Blog', controller: personalBlogUrlController, keyboardType: TextInputType.url),
                  const SizedBox(height: 16),
                  CustomTextField(labelText: 'Facebook', controller: facebookUrlController, keyboardType: TextInputType.url),
                  const SizedBox(height: 16),
                  CustomTextField(labelText: 'Twitter', controller: linkedInUrlController, keyboardType: TextInputType.url),
                  const SizedBox(height: 16),
                  CustomTextField(labelText: 'Instagram', controller: instagramUrlController, keyboardType: TextInputType.url),
                  const SizedBox(height: 16),
                  CustomTextField(labelText: 'X', controller: xUrlController, keyboardType: TextInputType.url),
                  const SizedBox(height: 8),
                ],
              ),
            ),
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
    );
  }
}