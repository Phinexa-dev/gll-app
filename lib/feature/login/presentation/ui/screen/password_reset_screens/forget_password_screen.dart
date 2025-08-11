import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/login/presentation/controller/forgot_password_controller.dart';
import 'package:go_router/go_router.dart';

import '../../../../../welcome/presentation/ui/widget/logo.dart';
import '../../../state/forgot_password_state.dart';

class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  String? errorText;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forgotPasswordControllerProvider);

    // Listen for state changes to handle navigation and errors
    ref.listen<ForgotPasswordState>(forgotPasswordControllerProvider, (
      previous,
      next,
    ) {
      if (next.isSuccess == true && mounted) {
        // Navigate to success screen on success
        context.pushNamed(RouteName.successResetScreen);
      } else if (next.isFailure == true && mounted) {
        // Show error message on failure
        setState(() {
          errorText =
              next.errorMessage ??
              'Failed to send reset link. Please try again.';
        });
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(heightFactor: 10 / 3.2),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 48),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Forgot password?',
                            style: PhinexaFont.headingDoubleExLargeExBold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Don\'t worry, we\'ll send you the instructions.',
                            style: PhinexaFont.contentRegular.copyWith(
                              color: PhinexaColor.grey,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 48),
                        CustomTextField(
                          labelText: 'Email Address',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        if (errorText != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Text(
                              errorText!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        const SizedBox(height: 32),
                        StartButton(
                          label: 'Send Password Reset Link',
                          onPressed: () async {
                            final email = emailController.text.trim();
                            if (email.isEmpty) {
                              setState(() {
                                errorText = 'Please enter your email address';
                              });
                              return;
                            }
                            if (!_isValidEmail(email)) {
                              setState(() {
                                errorText =
                                    'Please enter a valid email address';
                              });
                              return;
                            }
                            setState(() {
                              errorText = null;
                            });
                            ref
                                .read(forgotPasswordControllerProvider.notifier)
                                .forgotPassword(email);
                          },
                        ),
                        TextButton(
                          onPressed: () => context.pushNamed(RouteName.signIn),
                          child: Text(
                            'Back to login',
                            style: PhinexaFont.labelMedium.copyWith(
                              color: PhinexaColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Full-screen loader
          if (state.isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
