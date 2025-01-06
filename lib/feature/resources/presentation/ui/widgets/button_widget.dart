import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gll/common/theme/fonts.dart';

class IconButtonWidget extends ConsumerWidget {
  final bool isSelected;
  final bool isLikeButton;
  final VoidCallback onPressed;
  final String imagePath;
  final String? pressedImagePath;
  final int amount;

  const IconButtonWidget({
    super.key,
    this.isSelected = false,
    this.isLikeButton = false,
    required this.onPressed,
    required this.imagePath,
    this.pressedImagePath,
    required this.amount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            if (isLikeButton) SizedBox(height: 8),
            Text('$amount', style: PhinexaFont.featureEmphasis),
          ],
        ),
        IconButton(
          isSelected: isSelected,
          onPressed: onPressed,
          selectedIcon: pressedImagePath != null
              ? SvgPicture.asset(
            pressedImagePath!,
            height: 24,
            width: 24,
          )
              : null, // Check if `pressedImagePath` is null and avoid using it
          icon: SvgPicture.asset(
            imagePath,
            height: 24,
            width: 24,
          ),
        ),
      ],
    );
  }
}
