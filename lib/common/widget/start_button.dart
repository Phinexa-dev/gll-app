import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartButton extends ConsumerWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isGlow;
  final bool iconVisible;

  const StartButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isGlow = false,
    this.iconVisible = false,
  });

  @override
    Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE5C36C),
        padding: const EdgeInsets.symmetric(
          horizontal: 34,
          vertical: 6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: isGlow ? 15 : 8,
        shadowColor: isGlow ? const Color(0xFFE5C36C).withAlpha(150) : Colors.transparent,
        splashFactory: InkSplash.splashFactory,
      ),
      onPressed: onPressed,
      child: iconVisible
          ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right,
                size: 30,
                color: Colors.black,
              ),
            ],
          )
          : Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
    );
  }
}
