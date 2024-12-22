import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/custom_divider.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/social_media_options.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {

  @override
  Widget build(BuildContext context) {

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
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your details below',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(labelText: 'Full Name', controller: fullNameController),
                  const SizedBox(height: 8),
                  CustomTextField(labelText: 'Email Address', controller: emailController, keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 8),
                  CustomTextField(labelText: 'Password', controller: passwordController, obscureText: true),
                  const SizedBox(height: 8),
                  CustomTextField(labelText: 'Confirm Password', controller: confirmPasswordController, obscureText: true),
                  const SizedBox(height: 8),
                  CustomTextField(labelText: 'Phone Number', controller: phoneNumberController, keyboardType: TextInputType.phone),
                  const SizedBox(height: 16),
                  StartButton(
                      iconVisible: true,
                      label: 'Create account',
                      onPressed: () {
                        // Login logic
                      }
                  )
                ],
              ),
            ),

            CustomDivider(label: 'Or'),

            const SizedBox(height: 16),

            Expanded(
              flex: 1,
              child: SocialMediaOptions(),
            ),
          ],
        ),
      ),
    );
  }
}