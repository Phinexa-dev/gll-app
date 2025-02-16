import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart'; // Import your font styles

class CustomRadioQuestion extends StatefulWidget {
  final String question;
  final ValueChanged<bool?> onChanged;

  const CustomRadioQuestion({
    super.key,
    required this.question,
    required this.onChanged,
  });

  @override
  _CustomRadioQuestionState createState() => _CustomRadioQuestionState();
}

class _CustomRadioQuestionState extends State<CustomRadioQuestion> {
  bool? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question Text
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.question,
            style: PhinexaFont.contentRegular, // Applying custom font
          ),
        ),
        // Radio buttons
        Row(
          children: [
            _buildRadioOption("Yes", true),
            const SizedBox(width: 20),
            _buildRadioOption("No", false),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioOption(String label, bool value) {
    bool isSelected = selectedValue == value;

    return Row(
      children: [
        Radio<bool>(
          value: value,
          visualDensity: VisualDensity(horizontal: -2, vertical: -2),
          groupValue: selectedValue,
          onChanged: (val) {
            setState(() {
              selectedValue = val;
            });
            widget.onChanged(val);
          },
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (states) => isSelected
                ? PhinexaColor.primaryLightBlue
                : PhinexaColor.primaryLightBlue.withOpacity(0.5),
          ),
        ),
        Text(
          label,
          style: PhinexaFont.contentRegular.copyWith(
            color: isSelected ? PhinexaColor.black : PhinexaColor.grey,
          ),
        ),
      ],
    );
  }
}
