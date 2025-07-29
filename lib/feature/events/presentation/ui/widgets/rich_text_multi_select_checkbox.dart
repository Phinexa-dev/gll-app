import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../provider/multi_select_response_provider.dart';

class RichTextMultiSelectCheckbox extends ConsumerStatefulWidget {
  final String question;
  final List<Map<String, String>> options;

  const RichTextMultiSelectCheckbox({
    super.key,
    required this.question,
    required this.options,
  });

  @override
  _RichTextMultiSelectCheckboxState createState() =>
      _RichTextMultiSelectCheckboxState();
}

class _RichTextMultiSelectCheckboxState
    extends ConsumerState<RichTextMultiSelectCheckbox> {
  Set<String> _selectedAnswers = {}; // Local state to manage selections

  @override
  void initState() {
    super.initState();
    // Initialize _selectedAnswers from the provider's current state
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

    // Update the Riverpod provider with the modified list of selected items
    ref
        .read(surveyMultiSelectResponseProvider.notifier)
        .updateResponse(widget.question, _selectedAnswers.toList());
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(surveyMultiSelectResponseProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.question,
            style: PhinexaFont.contentRegular,
          ),
        ),
        ...widget.options.map((option) {
          final title = option["title"]!;
          final description = option["description"]!;
          final bool isSelected = _selectedAnswers.contains(title);

          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 4.0), // Adjust vertical padding as needed
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Crucial for top alignment
              children: [
                SizedBox(
                  width: 24.0, // Standard checkbox width
                  height: 24.0, // Standard checkbox height
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (bool? newValue) {
                      _onCheckboxChanged(newValue, title);
                    },
                    activeColor: PhinexaColor.primaryLightBlue,
                    checkColor: PhinexaColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(
                      color: isSelected
                          ? PhinexaColor.primaryLightBlue
                          : PhinexaColor.primaryLightBlue.withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Space between checkbox and text
                Expanded(
                  // Ensures text wraps within available space
                  child: GestureDetector(
                    // Make the text tappable too
                    onTap: () {
                      _onCheckboxChanged(!isSelected, title); // Toggle on tap
                    },
                    child: RichText(
                      text: TextSpan(
                        style: PhinexaFont.contentRegular,
                        children: [
                          TextSpan(
                            text: title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? PhinexaColor.black
                                  : PhinexaColor.darkGrey,
                            ),
                          ),
                          if (description.isNotEmpty)
                            TextSpan(
                              text: " – $description",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: isSelected
                                    ? PhinexaColor.black
                                    : PhinexaColor.darkGrey,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
