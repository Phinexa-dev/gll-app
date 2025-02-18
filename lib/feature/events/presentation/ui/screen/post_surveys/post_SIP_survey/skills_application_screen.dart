import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../widgets/survey_question_widget.dart';

class SIPSkillsApplicationScreen extends ConsumerStatefulWidget {
  const SIPSkillsApplicationScreen({super.key});

  @override
  _SIPSkillsApplicationScreenState createState() =>
      _SIPSkillsApplicationScreenState();
}

class _SIPSkillsApplicationScreenState
    extends ConsumerState<SIPSkillsApplicationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Flexible(
          child: Text(
            'Post Survey - SIP',
            style: PhinexaFont.highlightAccent,
            maxLines: 2, // Allow text to break into two lines
            overflow: TextOverflow.ellipsis, // Show '...' if text overflows
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Skills Application",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Please indicate your level of agreement with the following statements",
                style: PhinexaFont.highlightRegular,
              ),
              SizedBox(
                height: 20,
              ),
              SurveyQuestion(
                  question:
                      "I was able to apply the leadership skills I learned during the Leadership  Academy to my project"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(
                  question:
                      "The Sustainable Impact Plan module helped me structure and execute my  project effectively"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(
                  question:
                      "I felt confident in leading my team or community during the project"),
              SizedBox(
                height: 20,
              ),
              SurveyQuestion(
                  question:
                      "I was able to handle challenges or setbacks during the project using the  leadership skill I learned"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                      width: 100,
                      label: "Next",
                      icon: Icons.chevron_right_rounded,
                      height: 40,
                      onPressed: () {
                        context.pushNamed(RouteName.sipProjectImpactScreen);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
