import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/signup/presentation/controller/sign_up_contoller.dart';
import 'package:gll/feature/system_feedback/model/feedback.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/custom_divider.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/social_media_options.dart';
import 'package:go_router/go_router.dart';

import '../../../../system_feedback/provider/feedback_provider.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {

  String phoneCode = '+94';

  @override
  Widget build(BuildContext context) {

    final feedBackService = ref.read(feedbackServiceProvider);

    // final isLoading = ref.watch(signUpControllerProvider.select((value) => value.isLoading));
    final isLoading = ref.watch(signUpControllerProvider).isLoading;
    final isSuccess = ref.watch(signUpControllerProvider).isSuccess;
    final isFailure = ref.watch(signUpControllerProvider).isFailure;

    if(isSuccess != null && isSuccess){
      // use system feedback to show the success message
      feedBackService.showSnackBar("Registration successful", FeedbackType.success);
      Navigator.pop(context);
      context.goNamed(RouteName.welcome);
    }

    if(isFailure != null && isFailure){
      final errorMessage = ref.watch(signUpControllerProvider).errorMessage;
      // use system feedback to show the error message
      feedBackService.showSnackBar(errorMessage?? "Registration failed", FeedbackType.error);
    }

    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();


    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
                      style: PhinexaFont.headingLarge,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your details below',
                      style: PhinexaFont.captionRegular.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(labelText: 'Full Name', controller: fullNameController),
                  const SizedBox(height: 8),
                  CustomTextField(labelText: 'Email Address', controller: emailController, keyboardType: TextInputType.emailAddress),
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
                      Expanded(child: buildTextField(label: '',controller: phoneNumberController,keyboardType: TextInputType.phone, hint: 'Phone Number*')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(labelText: 'Password', controller: passwordController, obscureText: true),
                  const SizedBox(height: 8),
                  CustomTextField(labelText: 'Confirm Password', controller: confirmPasswordController, obscureText: true),
                  const SizedBox(height: 16),
                  StartButton(
                      iconVisible: true,
                      label: 'Create account',
                      onPressed: () async {
                        // Sign up logic
                        final formData = {
                          'fullName': fullNameController.text,
                          'email': emailController.text,
                          'password': passwordController.text,
                          'confirmPassword': confirmPasswordController.text,
                          'dialCode': phoneCode,
                          'phoneNumber': phoneNumberController.text,
                        };

                        //set the form data to the controller
                        ref.read(signUpControllerProvider.notifier).setFormData(formData);
                        //call the sign up method
                        final result = await ref.read(signUpControllerProvider.notifier).signUp();

                        // Navigator.pop(context);
                        // context.goNamed(RouteName.dashboard);
                      }
                  )
                ],
              ),
            ),

            // CustomDivider(label: 'Or'),

            // const SizedBox(height: 16),

            // Expanded(
            //   flex: 1,
            //   child: SocialMediaOptions(),
            // ),
          ],
        ),
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