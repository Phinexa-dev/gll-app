import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../provider/survey_radio_string_response_provider.dart';
import '../../../widgets/survey_question_widget.dart';

class SIPSkillsApplicationScreen extends ConsumerStatefulWidget {
  const SIPSkillsApplicationScreen({super.key});

  @override
  _SIPSkillsApplicationScreenState createState() =>
      _SIPSkillsApplicationScreenState();
}

class _SIPSkillsApplicationScreenState
    extends ConsumerState<SIPSkillsApplicationScreen> {
  final _questionErrors = {
    "I was able to apply the leadership skills I learned during the Leadership Academy to my project.":
        ValueNotifier<String?>(null),
    "The Sustainable Impact Plan module helped me structure and execute my project effectively.":
        ValueNotifier<String?>(null),
    "I felt confident in leading my with team or community during the project.":
        ValueNotifier<String?>(null),
    "I was able to handle challenges or setbacks during the project using the leadership skill I learned.":
        ValueNotifier<String?>(null),
  };

  @override
  void dispose() {
    for (var error in _questionErrors.values) {
      error.dispose();
    }
    super.dispose();
  }

  void _validateForm() {
    bool isValid = true;
    final responses = ref.read(radioStringQuestionResponseProvider);

    // Validate all questions
    _questionErrors.forEach((question, errorNotifier) {
      if (responses[question] == null) {
        errorNotifier.value = 'Please answer this question';
        isValid = false;
      } else {
        errorNotifier.value = null;
      }
    });

    if (isValid) {
      context.pushNamed(RouteName.sipProjectImpactScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Post Survey - SIP',
          style: PhinexaFont.highlightAccent,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("Skills Application", style: PhinexaFont.headingLarge),
              const SizedBox(height: 20),
              Text(
                "Please indicate your level of agreement with the following statements.",
                style: PhinexaFont.highlightRegular,
              ),
              const SizedBox(height: 20),

              // Question 1
              _buildQuestionWidget(
                "I was able to apply the leadership skills I learned during the Leadership Academy to my project.",
              ),
              const SizedBox(height: 15),

              // Question 2
              _buildQuestionWidget(
                "The Sustainable Impact Plan module helped me structure and execute my project effectively.",
              ),
              const SizedBox(height: 15),

              // Question 3
              _buildQuestionWidget(
                "I felt confident in leading my with team or community during the project.",
              ),
              const SizedBox(height: 20),

              // Question 4
              _buildQuestionWidget(
                "I was able to handle challenges or setbacks during the project using the leadership skill I learned.",
              ),
              const SizedBox(height: 10),

              // Next Button
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
                      onPressed: _validateForm,
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

  Widget _buildQuestionWidget(String question) {
    return ValueListenableBuilder<String?>(
      valueListenable: _questionErrors[question]!,
      builder: (context, error, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SurveyQuestion(question: question),
            if (error != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child: Text(error, style: TextStyle(color: Colors.red)),
              ),
          ],
        );
      },
    );
  }
}
