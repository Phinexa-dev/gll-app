import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomIconButton extends ConsumerWidget {
  final String label;
  final VoidCallback onPressed;
  final double height;
  final String iconPath;

  const CustomIconButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.height,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: PhinexaColor.primaryColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          foregroundColor: PhinexaColor.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: height * 0.4,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: PhinexaFont.captionRegular.copyWith(
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
