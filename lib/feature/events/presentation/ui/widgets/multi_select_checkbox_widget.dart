import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class MultiSelectCheckboxWidget extends StatefulWidget {
  final String question;
  final List<String> answers;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectCheckboxWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectCheckboxWidgetState createState() =>
      _MultiSelectCheckboxWidgetState();
}

class _MultiSelectCheckboxWidgetState extends State<MultiSelectCheckboxWidget> {
  final Set<String> _selectedAnswers = {};

  void _onCheckboxChanged(bool? isChecked, String answer) {
    setState(() {
      if (isChecked == true) {
        _selectedAnswers.add(answer);
      } else {
        _selectedAnswers.remove(answer);
      }
    });

    widget.onSelectionChanged(_selectedAnswers.toList());
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
                  color: isSelected ? Colors.black : Colors.grey,
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
