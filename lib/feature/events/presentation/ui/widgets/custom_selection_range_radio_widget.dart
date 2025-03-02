import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomSelectionRangeRadioWidget extends StatefulWidget {
  @override
  _CustomSelectionRangeRadioWidgetState createState() =>
      _CustomSelectionRangeRadioWidgetState();
}

class _CustomSelectionRangeRadioWidgetState
    extends State<CustomSelectionRangeRadioWidget> {
  String? selectedOption;

  final List<String> options = [
    "1-20",
    "20-50",
    "50-75",
    "75-100",
    "100-150",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        return RadioListTile<String>(
          value: option,
          contentPadding: EdgeInsets.zero,
          groupValue: selectedOption,
          dense: true,
          visualDensity: VisualDensity.compact,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (states) => selectedOption != null
                ? PhinexaColor.primaryLightBlue
                : PhinexaColor.primaryLightBlue.withOpacity(0.5),
          ),
          title: Text(
            option,
            style: PhinexaFont.contentRegular,
          ),
          activeColor: Colors.blue,
        );
      }).toList(),
    );
  }
}
