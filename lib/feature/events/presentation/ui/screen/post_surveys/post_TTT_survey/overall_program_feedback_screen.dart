import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../../common/theme/colors.dart';
import '../../../provider/combine_response.dart';
import '../../../provider/survey_radio_string_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/survey_question_widget.dart';

class TTTOverallProgramFeedbackScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const TTTOverallProgramFeedbackScreen({
    super.key,
    required this.eventIdentity,
  });

  @override
  _TTTOverallProgramFeedbackScreenState createState() =>
      _TTTOverallProgramFeedbackScreenState();
}

class _TTTOverallProgramFeedbackScreenState
    extends ConsumerState<TTTOverallProgramFeedbackScreen> {
  DateTime? _selectedDate;
  final _dateError = ValueNotifier<String?>(null);

  // Track errors for each question
  final _questionErrors = {
    "The Leadership Academy and Train the Trainer Workshop met my expectations":
        ValueNotifier<String?>(null),
    "The program was well-organized and easy to follow":
        ValueNotifier<String?>(null),
    "The content was practical, intuitive, and helpful":
        ValueNotifier<String?>(null),
    "The training materials and format were effective for preparing facilitators":
        ValueNotifier<String?>(null),
    "I was satisfied with the learning content and facilitation strategies provided":
        ValueNotifier<String?>(null),
  };

  @override
  void dispose() {
    // Dispose all value notifiers
    _dateError.dispose();
    for (var error in _questionErrors.values) {
      error.dispose();
    }
    super.dispose();
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
            maxLines: 2, // Allow text to break into two lines
            overflow: TextOverflow.ellipsis, // Show '...' if text overflows
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: PhinexaColor.black),
          onPressed: () {
            Navigator.pop(context);
            clearSurveyResponses(ref);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ValueListenableBuilder<String?>(
                valueListenable: _dateError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: PhinexaFont.highlightRegular,
                          children: [
                            TextSpan(
                              text:
                                  "Thank you for participating in the Leadership Academy ",
                            ),
                            TextSpan(
                              text: "Train the Trainer",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: " on ",
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () => _selectDate(context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _selectedDate == null
                                          ? "______________ "
                                          : '\t ${DateFormat.yMMMMd().format(_selectedDate!)}',
                                      style:
                                          PhinexaFont.highlightRegular.copyWith(
                                        decoration: _selectedDate != null
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(Icons.calendar_today_outlined,
                                        size: 14),
                                  ],
                                ),
                              ),
                            ),
                            TextSpan(
                              text:
                                  ". \n \nYour feedback is valuable and will help improve future programs. "
                                  "This survey is voluntary, and all responses will remain anonymous.",
                            ),
                          ],
                        ),
                      ),
                      if (error != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child:
                              Text(error, style: TextStyle(color: Colors.red)),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              Text("Overall Workshop Feedback",
                  style: PhinexaFont.headingLarge),
              SizedBox(height: 20),
              Text("Please rate the following statements",
                  style: PhinexaFont.featureRegular),
              SizedBox(height: 20),

              // Question 1
              _buildQuestionWidget(
                "The Leadership Academy and Train the Trainer Workshop met my expectations",
                _questionErrors[
                    "The Leadership Academy and Train the Trainer Workshop met my expectations"]!,
              ),
              SizedBox(height: 15),

              // Question 2
              _buildQuestionWidget(
                "The program was well-organized and easy to follow",
                _questionErrors[
                    "The program was well-organized and easy to follow"]!,
              ),
              SizedBox(height: 15),

              // Question 3
              _buildQuestionWidget(
                "The content was practical, intuitive, and helpful",
                _questionErrors[
                    "The content was practical, intuitive, and helpful"]!,
              ),
              SizedBox(height: 15),

              // Question 4
              _buildQuestionWidget(
                "The training materials and format were effective for preparing facilitators",
                _questionErrors[
                    "The training materials and format were effective for preparing facilitators"]!,
              ),
              SizedBox(height: 15),

              // Question 5
              _buildQuestionWidget(
                "I was satisfied with the learning content and facilitation strategies provided",
                _questionErrors[
                    "I was satisfied with the learning content and facilitation strategies provided"]!,
              ),
              SizedBox(height: 10),

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
                      onPressed: () => _validateForm(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionWidget(
      String question, ValueNotifier<String?> errorNotifier) {
    return ValueListenableBuilder<String?>(
      valueListenable: errorNotifier,
      builder: (context, error, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SurveyQuestion(
              question: question,
            ),
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

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateError.value = null;
      });
      ref
          .read(surveyTextFieldResponseProvider.notifier)
          .updateResponse("Date", _selectedDate.toString());
    }
  }

  void _validateForm() {
    bool isValid = true;

    // Validate date
    if (_selectedDate == null) {
      _dateError.value = 'Please select a date';
      isValid = false;
    } else {
      _dateError.value = null;
    }

    // Validate questions
    final responses = ref.read(radioStringQuestionResponseProvider);
    for (var question in _questionErrors.keys) {
      if (responses[question] == null) {
        _questionErrors[question]!.value = 'Please answer this question';
        isValid = false;
      } else {
        _questionErrors[question]!.value = null;
      }
    }

    if (isValid) {
      context.pushNamed(
        RouteName.tttModuleSpecificFeedbackScreen,
        extra: widget.eventIdentity,
      );
    }
  }
}
