import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../provider/survey_radio_response_provider.dart'; // Import your Riverpod provider

class CustomRadioQuestion extends ConsumerStatefulWidget {
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

class _CustomRadioQuestionState extends ConsumerState<CustomRadioQuestion> {
  bool? selectedValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final savedResponse =
          ref.read(radioQuestionResponseProvider)[widget.question];
      if (savedResponse != null) {
        setState(() {
          selectedValue = savedResponse;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.question,
            style: PhinexaFont.contentRegular,
          ),
        ),
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
            ref
                .read(radioQuestionResponseProvider.notifier)
                .updateResponse(widget.question, val);
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
