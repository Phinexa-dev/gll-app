import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../provider/survey_radio_string_response_provider.dart';

class SurveyQuestion extends ConsumerStatefulWidget {
  final String question;

  const SurveyQuestion({super.key, required this.question});

  @override
  _SurveyQuestionState createState() => _SurveyQuestionState();
}

class _SurveyQuestionState extends ConsumerState<SurveyQuestion> {
  String? _selectedOption;

  final List<String> _options = [
    "Strongly Agree",
    "Agree",
    "Neutral",
    "Disagree",
    "Strongly Disagree"
  ];

  @override
  void initState() {
    super.initState();
    final responses = ref.read(radioStringQuestionResponseProvider);
    _selectedOption = responses[widget.question];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: PhinexaFont.contentRegular,
        ),
        const SizedBox(height: 8),
        Column(
          children: _options.map((option) {
            return RadioListTile<String>(
              title: Text(
                option,
                style: PhinexaFont.contentRegular.copyWith(
                  color: _selectedOption == option
                      ? Colors.black
                      : PhinexaColor.darkGrey,
                ),
              ),
              value: option,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              dense: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              groupValue: _selectedOption,
              activeColor: PhinexaColor.primaryLightBlue,
              fillColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return PhinexaColor.primaryLightBlue;
                  }
                  return PhinexaColor.primaryLightBlue.withOpacity(0.5);
                },
              ),
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
                // Update the response in the provider
                ref
                    .read(radioStringQuestionResponseProvider.notifier)
                    .updateResponse(widget.question, value);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
