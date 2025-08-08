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

class LAOverallProgramFeedbackScreen extends ConsumerStatefulWidget {
  final String eventIdentity;

  const LAOverallProgramFeedbackScreen({
    super.key,
    required this.eventIdentity,
  });

  @override
  _LAOverallProgramFeedbackScreenState createState() =>
      _LAOverallProgramFeedbackScreenState();
}

class _LAOverallProgramFeedbackScreenState
    extends ConsumerState<LAOverallProgramFeedbackScreen> {
  DateTime? _selectedDate;
  final _dateError = ValueNotifier<String?>(null);

  final _questionErrors = {
    "The Leadership Academy met my expectations": ValueNotifier<String?>(null),
    "The program was well-organized and easy to follow": ValueNotifier<String?>(
      null,
    ),
    "The content was practical, intuitive, and helpful": ValueNotifier<String?>(
      null,
    ),
    "The training materials and format were suitable for high school youth":
        ValueNotifier<String?>(null),
    "I was satisfied with the learning content and materials":
        ValueNotifier<String?>(null),
  };

  @override
  void dispose() {
    _dateError.dispose();
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

    if (_selectedDate == null) {
      _dateError.value = 'Please select a date';
      isValid = false;
      errorMessage += "- Date\n";
    } else {
      _dateError.value = null;
    }

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
        RouteName.laModuleSpecificFeedbackScreen,
        extra: widget.eventIdentity,
      );
    } else {
      _showTopSnackBar(context, errorMessage);
    }
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: PhinexaColor.black),
          onPressed: () {
            Navigator.pop(context);
            clearSurveyResponses(ref);
          },
        ),
        title: Text(
          'Post Survey - Leadership Academy',
          style: PhinexaFont.highlightAccent,
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
                                        style: PhinexaFont.highlightRegular
                                            .copyWith(
                                              decoration: _selectedDate != null
                                                  ? TextDecoration.underline
                                                  : TextDecoration.none,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 14,
                                      ),
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
                            child: Text(
                              error,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Overall Program Feedback",
                  style: PhinexaFont.headingLarge,
                ),
                SizedBox(height: 20),
                _buildQuestionWidget(
                  "The Leadership Academy met my expectations",
                  _questionErrors["The Leadership Academy met my expectations"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "The program was well-organized and easy to follow",
                  _questionErrors["The program was well-organized and easy to follow"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "The content was practical, intuitive, and helpful",
                  _questionErrors["The content was practical, intuitive, and helpful"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "The training materials and format were suitable for high school youth",
                  _questionErrors["The training materials and format were suitable for high school youth"]!,
                ),
                SizedBox(height: 15),
                _buildQuestionWidget(
                  "I was satisfied with the learning content and materials",
                  _questionErrors["I was satisfied with the learning content and materials"]!,
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
