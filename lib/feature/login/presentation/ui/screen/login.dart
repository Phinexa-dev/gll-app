import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:gll/feature/login/presentation/controller/sign_in_contoller.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/custom_divider.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/social_media_options.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../common/theme/fonts.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../system_feedback/model/feedback.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    final feedBackService = ref.read(feedbackServiceProvider);

    // Watch the loading state
    final isLoading = ref.watch(signInControllerProvider).isLoading;
    final isSuccess = ref.watch(signInControllerProvider).isSuccess;
    final isFailure = ref.watch(signInControllerProvider).isFailure;
    final formData = ref.watch(signInControllerProvider).signInForm;

    if (isSuccess != null && isSuccess) {
      // Show success toast
      feedBackService.showToast("Login successful", type: FeedbackType.success);
      // Navigate to the dashboard
      context.goNamed(RouteName.dashboard);
    }

    if (isFailure != null && isFailure) {
      final errorMessage = ref.watch(signInControllerProvider).errorMessage;
      // Show error toast
      feedBackService.showToast(errorMessage ?? "Login failed",
          type: FeedbackType.error);
    }

    final TextEditingController emailController =
        TextEditingController(text: formData?['email'] ?? "");
    final TextEditingController passwordController =
        TextEditingController(text: formData?['password'] ?? "");

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // SVG as background
              Expanded(
                flex: 14,
                child: SvgPicture.asset(
                  'assets/welcome/login_bg.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 15,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login',
                            style: PhinexaFont.headingDoubleExLarge,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: PhinexaFont.labelRegular.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: WidgetStateProperty.all(
                                            EdgeInsets.zero),
                                      ),
                                      onPressed: () =>
                                          context.pushNamed(RouteName.signUp),
                                      child: Text(
                                        'Create Account',
                                        style:
                                            PhinexaFont.labelRegular.copyWith(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      size: 30,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          labelText: 'Email Address',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          labelText: 'Password',
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: PhinexaFont.labelRegular.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  padding:
                                      WidgetStateProperty.all(EdgeInsets.zero),
                                ),
                                onPressed: () =>
                                    context.pushNamed(RouteName.welcome),
                                child: Text(
                                  'Reset Password',
                                  style: PhinexaFont.labelRegular.copyWith(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        StartButton(
                          label: 'Login',
                          onPressed: () async {
                            // Login logic
                            final formData = {
                              'email': emailController.text,
                              'password': passwordController.text,
                            };

                            // Set the form data to the controller
                            ref
                                .read(signInControllerProvider.notifier)
                                .setFormData(formData);
                            // Call the sign-in method
                            await ref
                                .read(signInControllerProvider.notifier)
                                .signIn();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Full-page loader
          if (isLoading)
            Container(
              color:
                  Colors.black.withOpacity(0.5), // Semi-transparent background
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white, // Customize the color if needed
                ),
              ),
            ),
        ],
      ),
    );
  }
}
