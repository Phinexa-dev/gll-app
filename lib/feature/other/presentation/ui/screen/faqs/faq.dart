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
    // add more Q&A maps here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("F&Qs"),
            Icon(Icons.more_vert_outlined),
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
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "General",
                  style: PhinexaFont.highlightBold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
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
