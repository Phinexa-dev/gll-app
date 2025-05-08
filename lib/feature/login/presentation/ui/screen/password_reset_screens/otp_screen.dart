import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../welcome/presentation/ui/widget/logo.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pinController = TextEditingController();
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 48),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter OTP',
                            style: PhinexaFont.headingDoubleExLargeExBold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Enter One-Time Pin sent to your email',
                          style: PhinexaFont.contentRegular.copyWith(
                              color: PhinexaColor.grey, letterSpacing: 0.5),
                        ),
                        const SizedBox(height: 32),
                        Pinput(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          length: 6,
                          controller: pinController,
                          onChanged: (pin) {},
                          onCompleted: (pin) {},
                          defaultPinTheme: PinTheme(
                            width: 48,
                            height: 48,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                // color: errorMessage.isNotEmpty && !showPinError
                                //     ? Colors.red
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.transparent,
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: 40,
                            height: 40,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: PhinexaColor.primaryColor,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                // color: errorMessage.isNotEmpty && !showPinError
                                //     ? Colors.red
                                color: PhinexaColor.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        StartButton(
                          label: 'Reset Password',
                          onPressed: () async {
                            context.pushNamed(RouteName.successResetScreen);
                          },
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn’t receive code?",
                              style: PhinexaFont.labelRegular.copyWith(
                                color: PhinexaColor.grey,
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  context.pushNamed(RouteName.signIn),
                              child: Text(
                                'Resent OTP',
                                style: PhinexaFont.labelRegular.copyWith(
                                  color: PhinexaColor.primaryColor,
                                ),
                              ),
                            ),
                          ],
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
