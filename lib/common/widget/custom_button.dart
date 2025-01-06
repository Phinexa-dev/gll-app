import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomButton extends ConsumerWidget {
  final String label;
  final VoidCallback onPressed;
  final double height;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.height
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap:onPressed,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Color(0xFF43A2B5), // Button background color
            borderRadius: BorderRadius.circular(25), // Circular edges
          ),
          alignment: Alignment.center,
          child: Text(label,
              style: PhinexaFont.contentRegular
                  .copyWith(color: PhinexaColor.white)),
        ));
  }
}
