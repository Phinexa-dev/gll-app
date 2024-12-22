import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/custom_divider.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/social_media_options.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();


    return FractionallySizedBox(
      heightFactor: 0.65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      'Login',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(labelText: 'Email Address', controller: emailController, keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  CustomTextField(labelText: 'Password', controller: passwordController, obscureText: true),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (_) {}),
                          const Text('Remember me'),
                        ],
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text('Forgot Password?'),
                      // ),
                    ],
                  ),
                  StartButton(
                      label: 'Login',
                      onPressed: () {
                        // Login logic
                      }
                  )
                ],
              ),
            ),

            CustomDivider(label: 'Sign in using'),

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