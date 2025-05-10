import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

/// A single FAQ entry: tap the row (or icon) to expand/collapse the answer.
class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1, color: PhinexaColor.grey),

        // The question row
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  widget.question,
                  style: PhinexaFont.contentAccent,
                ),

                // <-- circular bordered button
                trailing: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: PhinexaColor.primaryColor, width: 1),
                  ),
                  child: IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      _expanded ? Icons.remove : Icons.add,
                      color: PhinexaColor.primaryColor,
                    ),
                    onPressed: _toggle,
                    splashRadius: 20,
                  ),
                ),

                onTap: _toggle,
              ),

              // Animated answer
              AnimatedSize(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 200),
                child: ConstrainedBox(
                  constraints: _expanded
                      ? const BoxConstraints()
                      : const BoxConstraints(maxHeight: 0),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      widget.answer,
                      style: PhinexaFont.captionRegular,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
  }
}
