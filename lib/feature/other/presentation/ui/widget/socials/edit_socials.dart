import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import '../../../../../../common/widget/custom_icon_button.dart';

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
    final updatedValues = {
      'personalBlog': personalBlogUrlController.text,
      'facebook': facebookUrlController.text,
      'linkedIn': linkedInUrlController.text,
      'instagram': instagramUrlController.text,
      'x': xUrlController.text,
    };

    print(updatedValues);
  }

  @override
  Widget build(BuildContext context) {

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
                  CustomTextField(labelText: 'LinkedIn', controller: linkedInUrlController, keyboardType: TextInputType.url),
                  const SizedBox(height: 16),
                  CustomTextField(labelText: 'Instagram', controller: instagramUrlController, keyboardType: TextInputType.url),
                  const SizedBox(height: 16),
                  CustomTextField(labelText: 'X', controller: xUrlController, keyboardType: TextInputType.url),
                  const SizedBox(height: 8),
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
        ),
      ),
    );
  }
}