import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../common/theme/fonts.dart';
import '../../../../../system_feedback/model/feedback.dart';
import '../../../../../system_feedback/provider/feedback_provider.dart';

class ContactUs extends ConsumerStatefulWidget {
  const ContactUs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactUsState();
}

class _ContactUsState extends ConsumerState<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _regionCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sending = false;

  final _firstNameError = ValueNotifier<String?>(null);
  final _lastNameError = ValueNotifier<String?>(null);
  final _emailError = ValueNotifier<String?>(null);
  final _regionError = ValueNotifier<String?>(null);
  final _messageError = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _regionCtrl.dispose();
    _messageCtrl.dispose();
    _firstNameError.dispose();
    _lastNameError.dispose();
    _emailError.dispose();
    _regionError.dispose();
    _messageError.dispose();
    super.dispose();
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Message Sent!"),
          content: Text(
            "Thank you for reaching out! Our team is committed to getting in touch with you as soon as possible.",
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendEmail() async {
    bool isValid = true;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

    if (_firstNameCtrl.text.isEmpty) {
      _firstNameError.value = 'Please enter your first name';
      isValid = false;
    } else {
      _firstNameError.value = null;
    }

    if (_lastNameCtrl.text.isEmpty) {
      _lastNameError.value = 'Please enter your last name';
      isValid = false;
    } else {
      _lastNameError.value = null;
    }

    if (_emailCtrl.text.isEmpty) {
      _emailError.value = 'Please enter your email address';
      isValid = false;
    } else if (!emailRegex.hasMatch(_emailCtrl.text)) {
      _emailError.value = 'Please enter a valid email address';
      isValid = false;
    } else {
      _emailError.value = null;
    }

    if (_regionCtrl.text.isEmpty) {
      _regionError.value = 'Please enter your location';
      isValid = false;
    } else {
      _regionError.value = null;
    }

    if (_messageCtrl.text.isEmpty) {
      _messageError.value = 'Please enter a message';
      isValid = false;
    } else {
      _messageError.value = null;
    }

    if (!isValid) {
      return;
    }

    setState(() => _sending = true);
    Map<String, dynamic> templateParams = {
      'first_name': _firstNameCtrl.text,
      'last_name': _lastNameCtrl.text,
      'email': _emailCtrl.text,
      'region': _regionCtrl.text,
      'message': _messageCtrl.text,
    };
    try {
      await emailjs.send(
        dotenv.env['SERVICE_KEY']!,
        dotenv.env['TEMPLATE_ID_CONTACT_US']!,
        templateParams,
        emailjs.Options(
          publicKey: dotenv.env['PUBLIC_KEY']!,
          privateKey: dotenv.env['PUBLIC_KEY']!,
        ),
      );
      _showCompletionDialog();
    } catch (error) {
      String msg = 'Send failed';
      if (error is emailjs.EmailJSResponseStatus) {
        msg = 'Error ${error.status}: ${error.text}';
      }
      ref
          .read(feedbackServiceProvider)
          .showToast(msg, type: FeedbackType.error);
    } finally {
      setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text("Contact Us")],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            AbsorbPointer(
              absorbing: _sending,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SvgPicture.asset(
                        'assets/more/contactUs_bg.svg',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Get in Touch with Us',
                        style: PhinexaFont.headingExLarge,
                      ),
                      const SizedBox(height: 20),
                      ValueListenableBuilder<String?>(
                        valueListenable: _firstNameError,
                        builder: (context, error, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                labelText: 'First Name*',
                                controller: _firstNameCtrl,
                              ),
                              if (error != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    left: 8,
                                  ),
                                  child: Text(
                                    error,
                                    style: TextStyle(color: PhinexaColor.red),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder<String?>(
                        valueListenable: _lastNameError,
                        builder: (context, error, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                labelText: 'Last Name*',
                                controller: _lastNameCtrl,
                              ),
                              if (error != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    left: 8,
                                  ),
                                  child: Text(
                                    error,
                                    style: TextStyle(color: PhinexaColor.red),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder<String?>(
                        valueListenable: _regionError,
                        builder: (context, error, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                labelText: 'Your Location*',
                                controller: _regionCtrl,
                              ),
                              if (error != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    left: 8,
                                  ),
                                  child: Text(
                                    error,
                                    style: TextStyle(color: PhinexaColor.red),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder<String?>(
                        valueListenable: _emailError,
                        builder: (context, error, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                labelText: 'Email*',
                                controller: _emailCtrl,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              if (error != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    left: 8,
                                  ),
                                  child: Text(
                                    error,
                                    style: TextStyle(color: PhinexaColor.red),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder<String?>(
                        valueListenable: _messageError,
                        builder: (context, error, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                labelText: 'Message*',
                                controller: _messageCtrl,
                                minLines: 4,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                              ),
                              if (error != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    left: 8,
                                  ),
                                  child: Text(
                                    error,
                                    style: TextStyle(color: PhinexaColor.red),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      StartButton(
                        label: _sending ? 'Sending…' : 'Submit',
                        isLoading: _sending,
                        onPressed: () {
                          if (!_sending) {
                            _sendEmail();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_sending)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(color: PhinexaColor.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
