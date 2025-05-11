import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../../../../../common/theme/fonts.dart';
import '../../../../../system_feedback/model/feedback.dart';
import '../../../../../system_feedback/provider/feedback_provider.dart';

class Feedbacks extends ConsumerStatefulWidget {
  const Feedbacks({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedbacksState();
}

class _FeedbacksState extends ConsumerState<Feedbacks> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool _sending = false;

  Future<void> _sendFeedback() async {
    final feedBackService = ref.read(feedbackServiceProvider);
    setState(() => _sending = true);

    final templateParams = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'region': eventNameController.text,
      'message': messageController.text,
    };

    try {
      await emailjs.send(
        dotenv.env['SERVICE_KEY']!,
        dotenv.env['TEMPLATE_ID_FEEDBACK']!,
        templateParams,
        emailjs.Options(
          publicKey: dotenv.env['PUBLIC_KEY']!,
          privateKey: dotenv.env['PUBLIC_KEY']!,
        ),
      );

      feedBackService.showToast("Feedback sent successfully",
          type: FeedbackType.success);
      context.pop();
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
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    eventNameController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Feedbacks"),
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
                  SvgPicture.asset(
                    'assets/more/feedbacks_bg.svg',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text('Your Feedback', style: PhinexaFont.headingExLarge),
                  const SizedBox(height: 20),
                  CustomTextField(
                      labelText: 'First Name', controller: firstNameController),
                  const SizedBox(height: 16),
                  CustomTextField(
                      labelText: 'Last Name', controller: lastNameController),
                  const SizedBox(height: 16),
                  CustomTextField(
                      labelText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  CustomTextField(
                      labelText: 'Event Name', controller: eventNameController),
                  const SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Message',
                    controller: messageController,
                    minLines: 4,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 24),
                  StartButton(
                    label: _sending ? 'Sending…' : 'Submit',
                    isLoading: _sending,
                    onPressed: _sending ? () {} : _sendFeedback,
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
