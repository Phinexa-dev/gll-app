import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _regionCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sending = false;

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
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final feedBackService = ref.read(feedbackServiceProvider);
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
      feedBackService.showToast("Message sent successfully",
          type: FeedbackType.success);
      context.pop(); // go back
    } catch (error) {
      String msg = 'Send failed';
      if (error is emailjs.EmailJSResponseStatus) {
        msg = 'Error ${error.status}: ${error.text}';
      }
      feedBackService.showToast(msg, type: FeedbackType.error);
    } finally {
      setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Contact Us"),
            Icon(Icons.more_vert_outlined),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset('assets/more/contactUs_bg.svg',
                      fit: BoxFit.cover),
                  const SizedBox(height: 20),
                  Text('Get in Touch with Us',
                      style: PhinexaFont.headingExLarge),
                  const SizedBox(height: 20),
                  CustomTextField(
                      labelText: 'First Name', controller: _firstNameCtrl),
                  const SizedBox(height: 16),
                  CustomTextField(
                      labelText: 'Last Name', controller: _lastNameCtrl),
                  const SizedBox(height: 16),
                  CustomTextField(
                      labelText: 'Event Name', controller: _regionCtrl),
                  const SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Email',
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Message',
                    controller: _messageCtrl,
                    minLines: 4,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 24),
                  StartButton(
                    label: _sending ? 'Sending…' : 'Submit',
                    isLoading: _sending,
                    onPressed: _sending
                        ? () {}
                        : () {
                            _sendEmail();
                          },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
