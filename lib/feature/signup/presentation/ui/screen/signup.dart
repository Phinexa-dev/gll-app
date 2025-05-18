import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:gll/feature/signup/presentation/controller/sign_up_contoller.dart';
import 'package:gll/feature/system_feedback/model/feedback.dart';
import 'package:go_router/go_router.dart';

import '../../../../events/presentation/ui/widgets/custom_dropdown.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';
import '../../../../welcome/presentation/ui/widget/logo.dart';
import '../../state/sign_up_state.dart';

final phoneCodeProvider = StateProvider<String>((ref) => '+94');

final countryProvider = StateProvider<String?>((ref) {
  final formData = ref.read(signUpControllerProvider).signUpForm;
  return formData?['country'];
});

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
  // late TextEditingController countryController;

  @override
  void initState() {
    super.initState();
    final formData = ref.read(signUpControllerProvider).signUpForm;
    fullNameController = TextEditingController(text: formData?['fullName'] ?? "");
    emailController = TextEditingController(text: formData?['email'] ?? "");
    passwordController = TextEditingController(text: formData?['password'] ?? "");
    confirmPasswordController = TextEditingController(text: formData?['confirmPassword'] ?? "");
    phoneNumberController = TextEditingController(text: formData?['phoneNumber'] ?? "");
    // countryController = TextEditingController(text: formData?['country'] ?? "");
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    // countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feedBackService = ref.read(feedbackServiceProvider);
    final phoneCode = ref.watch(phoneCodeProvider);
    final selectedCountry = ref.watch(countryProvider);

    // Watch the loading state
    final isLoading = ref.watch(signUpControllerProvider).isLoading;
    final formData = ref.watch(signUpControllerProvider).signUpForm;

    ref.listen<SignUpState>(
      signUpControllerProvider,
      (previous, next) {
        if (next.isSuccess != null && next.isSuccess == true) {
          feedBackService.showToast("Registration successful",
              type: FeedbackType.success);
          ref.read(signUpControllerProvider.notifier).clearStates();
          ref.read(countryProvider.notifier).state = null;
          context.goNamed(RouteName.welcome);
        } else if (next.isFailure != null && next.isFailure == true) {
          final errorMessage = ref.watch(signUpControllerProvider).errorMessage;
          ref.read(signUpControllerProvider.notifier).clearStates();
          feedBackService.showToast(errorMessage ?? "Registration failed. Try again",
              type: FeedbackType.error);
        }
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(heightFactor: 10 / 3),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Already have an account?',
                                style: PhinexaFont.labelRegular.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () =>
                                        context.pushNamed(RouteName.signIn),
                                    child: Text(
                                      'Login',
                                      style: PhinexaFont.labelRegular.copyWith(
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
                        const SizedBox(height: 20),
                        CustomTextField(
                          labelText: 'Full Name',
                          controller: fullNameController,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          labelText: 'Email Address',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
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
                                DropdownMenuItem(value: '+1', alignment: Alignment.center, child: Text('+1')), // USA
                                DropdownMenuItem(value: '+91', alignment: Alignment.center, child: Text('+91')), // India
                                DropdownMenuItem(value: '+94', alignment: Alignment.center, child: Text('+94')), // Sri Lanka
                                DropdownMenuItem(value: '+355', alignment: Alignment.center, child: Text('+355')), // Albania
                                DropdownMenuItem(value: '+381', alignment: Alignment.center, child: Text('+381')), // Serbia
                                DropdownMenuItem(value: '+382', alignment: Alignment.center, child: Text('+382')), // Montenegro
                                DropdownMenuItem(value: '+383', alignment: Alignment.center, child: Text('+383')), // Kosovo
                                DropdownMenuItem(value: '+385', alignment: Alignment.center, child: Text('+385')), // Croatia
                                DropdownMenuItem(value: '+386', alignment: Alignment.center, child: Text('+386')), // Slovenia
                                DropdownMenuItem(value: '+387', alignment: Alignment.center, child: Text('+387')), // Bosnia and Herzegovina
                                DropdownMenuItem(value: '+359', alignment: Alignment.center, child: Text('+359')), // Bulgaria
                                DropdownMenuItem(value: '+389', alignment: Alignment.center, child: Text('+389')), // North Macedonia
                                DropdownMenuItem(value: '+977', alignment: Alignment.center, child: Text('+977')), // Nepal
                              ],
                              onChanged: (value) {
                                ref.read(phoneCodeProvider.notifier).state = value!;
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
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 8),
                        // const SizedBox(height: 8),
                        CustomDropdown(
                          fieldName: "Country",
                          selectedGender: selectedCountry,
                          hint: "Select a country",
                          items: const [
                            'Balkans',
                            'India',
                            'Macedonia',
                            'Nepal',
                            'Sri Lanka',
                            'USA',
                          ],
                          onChanged: (value) {
                            ref.read(countryProvider.notifier).state = value;
                          },
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          labelText: 'Password',
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          labelText: 'Confirm Password',
                          controller: confirmPasswordController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        StartButton(
                          label: 'Sign Up',
                          onPressed: () async {
                            // Sign up logic
                            final formData = {
                              'fullName': fullNameController.text,
                              'email': emailController.text,
                              'password': passwordController.text,
                              // 'country': countryController.text,
                              'country': selectedCountry?? '',
                              'confirmPassword': confirmPasswordController.text,
                              'dialCode': phoneCode,
                              'phoneNumber': phoneNumberController.text,
                            };

                            // Set the form data to the controller
                            ref
                                .read(signUpControllerProvider.notifier)
                                .setFormData(formData);
                            // Call the sign-up method
                            await ref
                                .read(signUpControllerProvider.notifier)
                                .signUp();

                            // final isSuccess = ref.watch(signUpControllerProvider).isSuccess;
                            // final isFailure = ref.watch(signUpControllerProvider).isFailure;
                            //
                            // if (isSuccess != null && isSuccess) {
                            //   // Show success toast
                            //   feedBackService.showToast("Registration successful",
                            //       type: FeedbackType.success);
                            //   // Navigate to the welcome screen
                            //   context.goNamed(RouteName.welcome);
                            // }
                            //
                            // if (isFailure != null && isFailure) {
                            //   final errorMessage = ref.watch(signUpControllerProvider).errorMessage;
                            //   // Show error toast
                            //   feedBackService.showToast(errorMessage ?? "Registration failed",
                            //       type: FeedbackType.error);
                            // }
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
              color: Colors.black.withAlpha(128), // Semi-transparent background
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

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    String hint = 'required*',
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
        ),
      ],
    );
  }
}
