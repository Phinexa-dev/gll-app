import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../widgets/survey_question_widget.dart';

class LAOverallProgramFeedbackScreen extends ConsumerStatefulWidget {
  const LAOverallProgramFeedbackScreen({super.key});

  @override
  _LAOverallProgramFeedbackScreenState createState() =>
      _LAOverallProgramFeedbackScreenState();
}

class _LAOverallProgramFeedbackScreenState
    extends ConsumerState<LAOverallProgramFeedbackScreen> {
  @override
  void initState() {
    super.initState();
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Post Survey-Leadership Academy',
            style: PhinexaFont.highlightAccent),
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
              RichText(
                text: TextSpan(
                  style: PhinexaFont.highlightRegular,
                  children: [
                    TextSpan(
                      text:
                          "Thank you for participating in the Leadership Academy on ",
                    ),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? " \t ______________ "
                                  : '\t ${DateFormat.yMMMMd().format(_selectedDate!)}',
                              style: PhinexaFont.highlightRegular.copyWith(
                                  decoration: _selectedDate != null
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.calendar_today_outlined, size: 14),
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Overall Program Feedback",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              SurveyQuestion(
                  question: "The Leadership Academy met my expectations"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(
                  question:
                      "The program was well-organized and easy to follow"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(
                  question:
                      "The content was practical, intuitive, and helpful"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(
                  question:
                      "The training materials and format were suitable for high school youth"),
              SizedBox(
                height: 15,
              ),
              SurveyQuestion(
                  question:
                      "I was satisfied with the learning content and materials"),
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
                        context.pushNamed(
                            RouteName.laModuleSpecificFeedbackScreen);
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
