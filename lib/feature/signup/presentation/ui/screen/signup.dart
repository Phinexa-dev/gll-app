import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/signup/presentation/controller/sign_up_contoller.dart';
import 'package:gll/feature/system_feedback/model/feedback.dart';
import 'package:go_router/go_router.dart';

import '../../../../event/presentation/ui/widgets/custom_dropdown.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';
import '../../../../welcome/presentation/ui/widget/logo.dart';
import '../../state/sign_up_state.dart';

final phoneCodeProvider = StateProvider<String>((ref) => '+94');

final genderProvider = StateProvider<String?>((ref) => '');

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneNumberController;
  late TextEditingController verificationCodeController;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    final formData = ref.read(signUpControllerProvider).signUpForm;
    fullNameController = TextEditingController(
      text: formData?['fullName'] ?? "",
    );
    emailController = TextEditingController(text: formData?['email'] ?? "");
    passwordController = TextEditingController(
      text: formData?['password'] ?? "",
    );
    confirmPasswordController = TextEditingController(
      text: formData?['confirmPassword'] ?? "",
    );
    phoneNumberController = TextEditingController(
      text: formData?['phoneNumber'] ?? "",
    );
    verificationCodeController = TextEditingController();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feedBackService = ref.read(feedbackServiceProvider);
    final phoneCode = ref.watch(phoneCodeProvider);
    final selectedGender = ref.watch(genderProvider);

    final signUpState = ref.watch(signUpControllerProvider);
    final isLoading = signUpState.isLoading;
    ref.listen<SignUpState>(signUpControllerProvider, (previous, next) {
      // Only show error messages here, success is handled in the controller
      if (next.isFailure != null && next.isFailure == true) {
        final errorMessage = ref.watch(signUpControllerProvider).errorMessage;
        ref.read(signUpControllerProvider.notifier).clearStates();
        feedBackService.showToast(
          errorMessage ?? "Registration failed. Try again",
          type: FeedbackType.error,
        );
      }
    });

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Logo(heightFactor: 10 / 3),

                        // Show either the signup form (stage 1) or the verification UI (stage 2).
                        if (signUpState.stage == 1) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Sign Up',
                                    style: PhinexaFont.headingDoubleExLarge,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Already have an account?',
                                        style:
                                            PhinexaFont.labelRegular.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () => context.pushNamed(
                                              RouteName.signIn,
                                            ),
                                            child: Text(
                                              'Login',
                                              style: PhinexaFont.labelRegular
                                                  .copyWith(color: Colors.blue),
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
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              children: [
                                CustomTextField(
                                  labelText: 'Full Name',
                                  controller: fullNameController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z\s]+$'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  labelText: 'Email Address',
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z0-9._%+-@]*$'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(8),
                                      alignment: Alignment.center,
                                      itemHeight: 50,
                                      style: PhinexaFont.labelRegular.copyWith(
                                        color: Colors.grey,
                                      ),
                                      value: phoneCode,
                                      items: const [
                                        DropdownMenuItem(
                                          value: '+1',
                                          alignment: Alignment.center,
                                          child: Text('+1'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+91',
                                          alignment: Alignment.center,
                                          child: Text('+91'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+94',
                                          alignment: Alignment.center,
                                          child: Text('+94'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+977',
                                          alignment: Alignment.center,
                                          child: Text('+977'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+355',
                                          alignment: Alignment.center,
                                          child: Text('+355'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+381',
                                          alignment: Alignment.center,
                                          child: Text('+381'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+382',
                                          alignment: Alignment.center,
                                          child: Text('+382'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+383',
                                          alignment: Alignment.center,
                                          child: Text('+383'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+385',
                                          alignment: Alignment.center,
                                          child: Text('+385'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+386',
                                          alignment: Alignment.center,
                                          child: Text('+386'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+387',
                                          alignment: Alignment.center,
                                          child: Text('+387'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+359',
                                          alignment: Alignment.center,
                                          child: Text('+359'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+389',
                                          alignment: Alignment.center,
                                          child: Text('+389'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+63',
                                          alignment: Alignment.center,
                                          child: Text('+63'),
                                        ),
                                        DropdownMenuItem(
                                          value: '+62',
                                          alignment: Alignment.center,
                                          child: Text('+62'),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        ref
                                            .read(phoneCodeProvider.notifier)
                                            .state = value!;
                                      },
                                      menuMaxHeight: 250,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: buildTextField(
                                        label: '',
                                        controller: phoneNumberController,
                                        keyboardType: TextInputType.phone,
                                        hint: 'Phone Number',
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                CustomDropdown(
                                  fieldName: 'Gender',
                                  fieldFont: PhinexaFont.labelRegular.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                  selectedValue: selectedGender == ''
                                      ? 'Not Selected'
                                      : selectedGender,
                                  hint: 'Select Gender',
                                  items: const [
                                    'Not Selected',
                                    'Male',
                                    'Female'
                                  ],
                                  onChanged: (value) {
                                    if (value == 'Not Selected') {
                                      ref.read(genderProvider.notifier).state =
                                          '';
                                    } else {
                                      ref.read(genderProvider.notifier).state =
                                          value;
                                    }
                                  },
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  labelText: 'Password',
                                  controller: passwordController,
                                  obscureText: !_isPasswordVisible,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z0-9@#\$%\^&\+=]*$'),
                                    ),
                                  ],
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  labelText: 'Confirm Password',
                                  controller: confirmPasswordController,
                                  obscureText: !_isConfirmPasswordVisible,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z0-9@#\$%\^&\+=]*$'),
                                    ),
                                  ],
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isConfirmPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isConfirmPasswordVisible =
                                            !_isConfirmPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Password must be at least 8 characters long and contain at least one letter and one number',
                                    style: PhinexaFont.labelRegular.copyWith(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: StartButton(
                              label: 'Sign Up',
                              onPressed: () async {
                                final formData = {
                                  'fullName': fullNameController.text,
                                  'email': emailController.text,
                                  'password': passwordController.text,
                                  'confirmPassword':
                                      confirmPasswordController.text,
                                  'dialCode': phoneCode,
                                  'phoneNumber': phoneNumberController.text,
                                  'gender': selectedGender ?? '',
                                };

                                ref
                                    .read(signUpControllerProvider.notifier)
                                    .setFormData(formData);
                                await ref
                                    .read(signUpControllerProvider.notifier)
                                    .signUp();
                              },
                            ),
                          ),
                        ] else if (signUpState.stage == 2) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              height: 380,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Verify your email',
                                      style: PhinexaFont.headingDoubleExLarge,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'A verification code was sent to',
                                      style: PhinexaFont.labelRegular,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: Text(
                                        signUpState.signUpForm?['email'] ?? '',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    CustomTextField(
                                      labelText: 'Verification Code',
                                      controller: verificationCodeController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [],
                                    ),
                                    if (signUpState.isFailure == true &&
                                        (signUpState.errorMessage != null &&
                                            signUpState
                                                .errorMessage!.isNotEmpty)) ...[
                                      const SizedBox(height: 8),
                                      Text(
                                        signUpState.errorMessage!,
                                        style:
                                            PhinexaFont.labelRegular.copyWith(
                                          color: Colors.red,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: StartButton(
                                            label: 'Verify',
                                            onPressed: () {
                                              final code =
                                                  verificationCodeController
                                                      .text
                                                      .trim();
                                              ref
                                                  .read(signUpControllerProvider
                                                      .notifier)
                                                  .setEnteredCode(code);
                                              ref
                                                  .read(signUpControllerProvider
                                                      .notifier)
                                                  .verifyAndSignup();
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        SizedBox(
                                          width: 140,
                                          child: ElevatedButton(
                                            onPressed: signUpState
                                                        .resendCooldownSeconds >
                                                    0
                                                ? null
                                                : () async {
                                                    await ref
                                                        .read(
                                                            signUpControllerProvider
                                                                .notifier)
                                                        .resendCode();
                                                  },
                                            child: Text(signUpState
                                                        .resendCooldownSeconds >
                                                    0
                                                ? 'Resend (${signUpState.resendCooldownSeconds}s)'
                                                : 'Resend'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    TextButton(
                                      onPressed: () {
                                        // clear the local controller and notify the notifier to cancel verification
                                        verificationCodeController.clear();
                                        ref
                                            .read(signUpControllerProvider
                                                .notifier)
                                            .cancelVerification();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (isLoading)
              Container(
                color: Colors.black.withAlpha(128),
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    String hint = 'required*',
    List<TextInputFormatter> inputFormatters = const [],
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: PhinexaFont.labelRegular.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
        if (label.isNotEmpty) const SizedBox(height: 8),
        CustomTextField(
          labelText: hint,
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
