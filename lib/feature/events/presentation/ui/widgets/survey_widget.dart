import 'package:flutter/material.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../../home/data/survey_response_model.dart';

class SurveyWidget extends StatefulWidget {
  final String title;
  final List<String> questions;
  final Function(SurveyResponse) onResponsesChanged;

  const SurveyWidget({
    super.key,
    required this.title,
    required this.questions,
    required this.onResponsesChanged,
  });

  @override
  _SurveyWidgetState createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  final Map<String, String> responses = {};

  final List<String> choices = [
    "Strongly Agree",
    "Agree",
    "Neutral",
    "Disagree",
    "Strongly Disagree",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: PhinexaFont.headingLarge,
          ),
          const SizedBox(height: 10),
          ...widget.questions.map((question) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: PhinexaFont.contentRegular,
                  ),
                  Column(
                    children: choices.map((choice) {
                      return RadioListTile<String>(
                        title: Text(choice,
                            style: PhinexaFont.contentRegular.copyWith(
                              color: responses[question] == choice
                                  ? Colors.black
                                  : Colors.grey,
                            )),
                        value: choice,
                        groupValue: responses[question],
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        // Reduce spacing
                        onChanged: (value) {
                          setState(() {
                            responses[question] = value!;
                            widget.onResponsesChanged(SurveyResponse(
                              title: widget.title,
                              responses: responses,
                            ));
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                ],
              )),
        ],
      ),
    );
  }
}
