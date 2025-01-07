import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButton extends ConsumerWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isGlow;
  final bool iconVisible;
  final IconData? icon;
  final Color iconColor;
  final String btnSize;
  final Color color;
  final Color textColour;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isGlow = false,
    this.iconVisible = false,
    this.icon,
    this.btnSize = "medium",
    this.color = const Color(0xFFE5C36C),
    this.textColour = Colors.black,
    this.iconColor = Colors.black,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double buttonHorizontalPadding = btnSize == "small" ? 14 : btnSize == "medium" ? 20 : 30;
    final double buttonVerticalPadding = btnSize == "small" ? 4 : btnSize == "medium" ? 6 : 8;
    final double fontSize = btnSize == "small" ? 12 : btnSize == "medium" ? 12 : 16;
    final double iconSize = btnSize == "small" ? 18 : btnSize == "medium" ? 20 : 30;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: borderColor != null? BorderSide(color: borderColor!, width: 1) : BorderSide.none,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          horizontal: buttonHorizontalPadding,
          vertical: buttonVerticalPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: isGlow ? 15 : 8,
        shadowColor: isGlow ? const Color(0xFFE5C36C).withAlpha(150) : Colors.transparent,
        splashFactory: InkSplash.splashFactory,
      ),
      onPressed: onPressed,
      child: icon != null
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color: textColour,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ],
      )
          : Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          color: textColour,
        ),
      ),
    );
  }
}
