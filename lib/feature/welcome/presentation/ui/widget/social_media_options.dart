import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

class SocialMediaOptions extends ConsumerWidget {

  const SocialMediaOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialButton(
              icon: Icons.g_mobiledata,
              label: 'Google',
              color: Colors.red,
            ),
            _buildSocialButton(
              icon: Icons.apple,
              label: 'Apple',
              color: Colors.black,
            ),
            _buildSocialButton(
              icon: Icons.facebook,
              label: 'Facebook',
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {
                // Show more options logic
              },
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: color.withAlpha(20),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: PhinexaFont.captionRegular.copyWith(
              color: color
          ),
        ),
      ],
    );
  }
}
