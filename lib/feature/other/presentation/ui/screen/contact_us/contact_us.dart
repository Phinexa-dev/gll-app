import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../common/theme/fonts.dart';
import '../../../../../../core/route/route_name.dart';

class ContactUs extends ConsumerStatefulWidget {
  const ContactUs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactUsState();
}

class _ContactUsState extends ConsumerState<ContactUs> {

  @override
  Widget build(BuildContext context) {

    // final feedBackService = ref.read(feedbackServiceProvider);

    // final isLoading = ref.watch(signUpControllerProvider.select((value) => value.isLoading));
    // final isLoading = ref.watch(signInControllerProvider).isLoading;
    // final isSuccess = ref.watch(signInControllerProvider).isSuccess;
    // final isFailure = ref.watch(signInControllerProvider).isFailure;
    // final formData = ref.watch(signInControllerProvider).signInForm;

    // if(isSuccess != null && isSuccess){
    //   // use system feedback to show the success message
    //   feedBackService.showToast("Login successful", type: FeedbackType.success);
    //   // Navigator.pop(context);
    //   context.goNamed(RouteName.dashboard);
    // }
    //
    // if(isFailure != null && isFailure){
    //   final errorMessage = ref.watch(signInControllerProvider).errorMessage;
    //   // use system feedback to show the error message
    //   feedBackService.showToast(errorMessage?? "Login failed", type: FeedbackType.error);
    // }
    //
    // final TextEditingController emailController = TextEditingController(text: formData?['email']?? "");
    // final TextEditingController passwordController = TextEditingController(text: formData?['password']?? "");
    final TextEditingController emailController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController regionController = TextEditingController();
    final TextEditingController messageController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Contact Us"),
            Icon(Icons.more_vert_outlined),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // SVG as background
                    SvgPicture.asset(
                      'assets/more/contactUs_bg.svg',
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Get in Touch with Us',
                        style: PhinexaFont.headingExLarge,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(labelText: 'First Name', controller: firstNameController, obscureText: true),
                    const SizedBox(height: 16),
                    CustomTextField(labelText: 'Last Name', controller: lastNameController, obscureText: true),
                    const SizedBox(height: 16),
                    CustomTextField(labelText: 'Event Name', controller: regionController, obscureText: true),
                    const SizedBox(height: 16),
                    CustomTextField(labelText: 'Email', controller: emailController, keyboardType: TextInputType.emailAddress,),
                    const SizedBox(height: 16),
                    CustomTextField(labelText: 'Message', controller: messageController, minLines: 4, maxLines: null, keyboardType: TextInputType.multiline,),
                    const SizedBox(height: 8),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Checkbox(value: false, onChanged: (_) {}),
                    //         Text(
                    //             'Remember me',
                    //              style: PhinexaFont.captionRegular,
                    //         ),
                    //       ],
                    //     ),
                    //     // TextButton(
                    //     //   onPressed: () {},
                    //     //   child: const Text('Forgot Password?'),
                    //     // ),
                    //   ],
                    // ),
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
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                              ),
                              onPressed: () => context.pushNamed(RouteName.welcome),
                              child: Text(
                                'Reset Password',
                                style: PhinexaFont.labelRegular.copyWith(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    StartButton(
                        label: 'Submit',
                        onPressed: () async {
                          // Login logic
                          final formData = {
                            'firstName': firstNameController.text,
                            'lastName': lastNameController.text,
                            'email': emailController.text,
                            'region': regionController.text,
                            'message': messageController.text,
                          };

                          //set the form data to the controller
                          // ref.read(signInControllerProvider.notifier).setFormData(formData);
                          //call the sign up method
                          // final result = await ref.read(signInControllerProvider.notifier).signIn();

                          // Navigator.pop(context);
                          // context.goNamed(RouteName.dashboard);
                        }
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}