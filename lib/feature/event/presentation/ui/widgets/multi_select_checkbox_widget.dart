import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../provider/multi_select_response_provider.dart';

// Provider to store multi-select responses
final surveyMultiSelectResponseProvider =
    StateNotifierProvider<SurveyMultiSelectNotifier, Map<String, List<String>>>(
        (ref) => SurveyMultiSelectNotifier());

class MultiSelectCheckboxWidget extends ConsumerStatefulWidget {
  final String question;
  final List<String> answers;

  const MultiSelectCheckboxWidget({
    super.key,
    required this.question,
    required this.answers,
  });

  @override
  _MultiSelectCheckboxWidgetState createState() =>
      _MultiSelectCheckboxWidgetState();
}

class _MultiSelectCheckboxWidgetState
    extends ConsumerState<MultiSelectCheckboxWidget> {
  Set<String> _selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    // Load previously selected answers from Riverpod state
    final storedAnswers =
        ref.read(surveyMultiSelectResponseProvider).containsKey(widget.question)
            ? ref.read(surveyMultiSelectResponseProvider)[widget.question]!
            : [];
    _selectedAnswers = Set<String>.from(storedAnswers);
  }

  void _onCheckboxChanged(bool? isChecked, String answer) {
    setState(() {
      if (isChecked == true) {
        _selectedAnswers.add(answer);
      } else {
        _selectedAnswers.remove(answer);
      }
    });

    // Update Riverpod state
    ref
        .read(surveyMultiSelectResponseProvider.notifier)
        .updateResponse(widget.question, _selectedAnswers.toList());
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
          children: widget.answers.map((answer) {
            bool isSelected = _selectedAnswers.contains(answer);
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              checkColor: PhinexaColor.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              dense: true,
              visualDensity: VisualDensity.compact,
              value: isSelected,
              onChanged: (isChecked) => _onCheckboxChanged(isChecked, answer),
              title: Text(
                answer,
                style: PhinexaFont.contentRegular.copyWith(
                  color:
                      isSelected ? PhinexaColor.black : PhinexaColor.darkGrey,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(
                color: isSelected
                    ? PhinexaColor.primaryLightBlue
                    : PhinexaColor.primaryLightBlue.withOpacity(0.5),
                width: 2.0,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
