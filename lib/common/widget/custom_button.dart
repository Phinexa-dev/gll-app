import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomButton extends ConsumerWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height;
  final double? width;
  final IconData? icon;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.height,
    this.width,
    this.icon,
    this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: PhinexaColor.primaryLightBlue,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child ??
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.white,
                  ),
                ),
                if (icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    icon,
                    color: PhinexaColor.white,
                  ),
                ],
              ],
            ),
      ),
    );
  }
}
