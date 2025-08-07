import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/other/presentation/ui/widget/faq_widget.dart';

class FAQs extends ConsumerStatefulWidget {
  const FAQs({super.key});

  @override
  ConsumerState<FAQs> createState() => _FAQsState();
}

class _FAQsState extends ConsumerState<FAQs> {
  final List<Map<String, String>> generalFaqs = [
    {
      'q': 'What is the Global Learning Lab App used for?',
      'a':
          'The app is your tool for tracking your Leadership Academy journey, Sustainable Impact Projects (SIPs), mentorship activities, and certifications. It keeps you connected and helps show your leadership growth over time.',
    },
    {
      'q': 'Who can use the app?',
      'a':
          'Leadership Academy participants, trainers, mentors, and partner organizations involved with Global Learning Lab International.',
    },
    {
      'q': 'How can I reset my password?',
      'a':
          'On the login screen, tap the "Reset Password" text button. You will be navigated to a page where you can enter your email address. A password reset link will be sent to your email.',
    },
    {
      'q': 'I didn’t receive a registration email. What should I do?',
      'a':
          'Check your spam or junk folder first. If you still don\'t see it, contact your local coordinator or email support@globallearninglab.org.',
    },
    {
      'q': 'How do I complete my post-event survey?',
      'a':
          'Go to the "Events" section using the main bottom navigation bar. Select the specific event you attended. Once you have completed registration for that event, a "Post Survey" button will appear on the event page. Tap it to complete your survey.',
    },
    {
      'q': 'How do I earn my certification?',
      'a':
          'Complete your Leadership Academy, submit your SIP updates, and finish the required surveys.',
    },
    {
      'q': 'Where can I see my certificates or badges?',
      'a': 'Find them anytime in the "Badges" section of your “Impact” page.',
    },
    {
      'q': 'What should I do if the app isn’t working properly?',
      'a':
          'Close and reopen the app first. If needed, update to the latest version. If issues continue, contact support@globallearninglab.org.',
    },
    {
      'q': 'Is my personal information safe?',
      'a':
          'Yes! We use encryption to keep your data safe. Your information is used only to support your leadership journey and track project impact. Also we will not provide your data to third parties without your additional permission',
    },
    // add more Q&A maps here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("FAQs"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // header image
              SvgPicture.asset('assets/more/faq_bg.svg', fit: BoxFit.cover),

              // title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  "Frequently Asked Questions",
                  style: PhinexaFont.headingLarge,
                ),
              ),

              // the ListView made to size itself
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: generalFaqs.length,
                itemBuilder: (ctx, i) => FAQItem(
                  question: generalFaqs[i]['q']!,
                  answer: generalFaqs[i]['a']!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
