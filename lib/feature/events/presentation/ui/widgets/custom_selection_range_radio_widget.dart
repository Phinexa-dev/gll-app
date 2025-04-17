import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../provider/survey_radio_string_response_provider.dart';

class CustomSelectionRangeRadioWidget extends ConsumerStatefulWidget {
  final String question;

  const CustomSelectionRangeRadioWidget({
    super.key,
    required this.question,
  });

  @override
  _CustomSelectionRangeRadioWidgetState createState() =>
      _CustomSelectionRangeRadioWidgetState();
}

class _CustomSelectionRangeRadioWidgetState
    extends ConsumerState<CustomSelectionRangeRadioWidget> {
  final List<String> _options = [
    "1-20",
    "20-50",
    "50-75",
    "75-100",
    "100-150",
    "Other"
  ];

  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    // Initialize from provider
    final responses = ref.read(radioStringQuestionResponseProvider);
    _selectedValue = responses[widget.question];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _options.map((option) {
        return RadioListTile<String>(
          value: option,
          contentPadding: EdgeInsets.zero,
          groupValue: _selectedValue,
          dense: true,
          visualDensity: VisualDensity.compact,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            // Update provider and notify parent
            ref
                .read(radioStringQuestionResponseProvider.notifier)
                .updateResponse(widget.question, value!);
          },
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (states) => _selectedValue != null
                ? PhinexaColor.primaryLightBlue
                : PhinexaColor.primaryLightBlue.withOpacity(0.5),
          ),
          title: Text(
            option,
            style: PhinexaFont.contentRegular.copyWith(
              color: _selectedValue == option ? Colors.black : Colors.grey,
            ),
          ),
          activeColor: PhinexaColor.primaryLightBlue,
        );
      }).toList(),
    );
  }
}
