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

class SuccessResetScreen extends ConsumerWidget {
  const SuccessResetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(forgotPasswordControllerProvider);
    final email = state.email ?? '';

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
                            'Check your email',
                            style: PhinexaFont.headingDoubleExLargeExBold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We have sent the password reset link to $email',
                            style: PhinexaFont.contentRegular.copyWith(
                                color: PhinexaColor.grey, letterSpacing: 0.5),
                          ),
                        ),
                        const SizedBox(height: 48),
                        StartButton(
                          label: 'Back to login',
                          onPressed: () => context.pushNamed(RouteName.signIn),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
