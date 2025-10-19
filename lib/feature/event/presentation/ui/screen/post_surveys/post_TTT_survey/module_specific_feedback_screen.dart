import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../provider/survey_radio_string_response_provider.dart';
import '../../../widgets/survey_question_widget.dart';

class TTTModuleSpecificFeedbackScreen extends ConsumerStatefulWidget {
  final int eventID;

  const TTTModuleSpecificFeedbackScreen({
    super.key,
    required this.eventID,
  });

  @override
  _TTTModuleSpecificFeedbackScreenState createState() =>
      _TTTModuleSpecificFeedbackScreenState();
}

class _TTTModuleSpecificFeedbackScreenState
    extends ConsumerState<TTTModuleSpecificFeedbackScreen> {
  final _questionErrors = {
    "Sustainable Development Goals, Vision Trees": ValueNotifier<String?>(null),
    "Leadership 101: Direction, Alignment, and Commitment":
        ValueNotifier<String?>(null),
    "Perspectives and Mindset": ValueNotifier<String?>(null),
    "Communication & Feedback/SBI": ValueNotifier<String?>(null),
    "Values and Actions": ValueNotifier<String?>(null),
    "Working in Teams": ValueNotifier<String?>(null),
    "Change Happens": ValueNotifier<String?>(null),
    "Sustainable Impact Project": ValueNotifier<String?>(null),
    "Principles of Experiential Learning": ValueNotifier<String?>(null),
    "Module Debrief Discussion": ValueNotifier<String?>(null),
    "Module Debrief Group Presentation": ValueNotifier<String?>(null),
    "Introduction to Practice Deliveries and Preparation":
        ValueNotifier<String?>(null),
    "Practice Delivery / Feedback Session": ValueNotifier<String?>(null),
    "Debriefing of Deliveries - FAQ": ValueNotifier<String?>(null),
    "Next Steps and Graduation": ValueNotifier<String?>(null),
  };

  @override
  void dispose() {
    for (var error in _questionErrors.values) {
      error.dispose();
    }
    super.dispose();
  }

  void _showTopSnackBar(BuildContext context, String message) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Text(message, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: 3)).then((value) {
      overlayEntry.remove();
    });
  }

  void _validateForm() {
    bool isValid = true;
    String errorMessage = "The following fields are required:\n";

    final responses = ref.read(radioStringQuestionResponseProvider);
    for (var question in _questionErrors.keys) {
      if (responses[question] == null) {
        _questionErrors[question]!.value = 'Please answer this question';
        isValid = false;
        errorMessage += "- $question\n";
      } else {
        _questionErrors[question]!.value = null;
      }
    }

    if (isValid) {
      context.pushNamed(
        RouteName.tttTrainerFacilitationFeedbackScreen,
        extra: widget.eventID,
      );
    } else {
      _showTopSnackBar(context, errorMessage);
    }
  }

  Widget _buildQuestionWidget(
    String question,
    ValueNotifier<String?> errorNotifier,
  ) {
    return ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Flexible(
          child: Text(
            'Post Survey - Train the Trainer',
            style: PhinexaFont.highlightAccent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Module Specific Feedback",
                  style: PhinexaFont.headingLarge,
                ),
                SizedBox(height: 20),
                Text(
                  "For each module, please indicate how strongly you agree with the statement:  \"This module was relevant, engaging, and beneficial for preparing facilitators.\"",
                  style: PhinexaFont.highlightRegular,
                ),
                SizedBox(height: 20),
                Text("Day 1", style: PhinexaFont.headingLarge),
                SizedBox(height: 20),
                _buildQuestionWidget(
                  "Sustainable Development Goals, Vision Trees",
                  _questionErrors["Sustainable Development Goals, Vision Trees"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Leadership 101: Direction, Alignment, and Commitment",
                  _questionErrors["Leadership 101: Direction, Alignment, and Commitment"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Perspectives and Mindset",
                  _questionErrors["Perspectives and Mindset"]!,
                ),
                SizedBox(height: 20),
                Text("Day 2", style: PhinexaFont.headingLarge),
                SizedBox(height: 20),
                _buildQuestionWidget(
                  "Communication & Feedback/SBI",
                  _questionErrors["Communication & Feedback/SBI"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Values and Actions",
                  _questionErrors["Values and Actions"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Working in Teams",
                  _questionErrors["Working in Teams"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Change Happens",
                  _questionErrors["Change Happens"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Sustainable Impact Project",
                  _questionErrors["Sustainable Impact Project"]!,
                ),
                SizedBox(height: 20),
                Text("Day 3", style: PhinexaFont.headingLarge),
                SizedBox(height: 20),
                _buildQuestionWidget(
                  "Principles of Experiential Learning",
                  _questionErrors["Principles of Experiential Learning"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Module Debrief Discussion",
                  _questionErrors["Module Debrief Discussion"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Module Debrief Group Presentation",
                  _questionErrors["Module Debrief Group Presentation"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Introduction to Practice Deliveries and Preparation",
                  _questionErrors["Introduction to Practice Deliveries and Preparation"]!,
                ),
                SizedBox(height: 20),
                Text("Day 4", style: PhinexaFont.headingLarge),
                SizedBox(height: 20),
                _buildQuestionWidget(
                  "Practice Delivery / Feedback Session",
                  _questionErrors["Practice Delivery / Feedback Session"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Debriefing of Deliveries - FAQ",
                  _questionErrors["Debriefing of Deliveries - FAQ"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "Next Steps and Graduation",
                  _questionErrors["Next Steps and Graduation"]!,
                ),
                SizedBox(height: 10),
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
                        onPressed: () => _validateForm(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
