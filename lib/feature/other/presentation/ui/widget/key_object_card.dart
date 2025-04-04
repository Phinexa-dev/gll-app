import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class KeyObjectCard extends ConsumerWidget {
  final String? iconPath;
  final int amount;
  final String featureDescription;

  const KeyObjectCard({
    super.key,
    this.iconPath,
    required this.amount,
    required this.featureDescription,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: PhinexaColor.extraLightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconPath != null && iconPath!.isNotEmpty) ...[
            SvgPicture.asset(
              iconPath!,
              height: 28,
              width: 28,
            ),
            const SizedBox(height: 20),
          ],
          Text('$amount', style: PhinexaFont.headingLarge),
          const SizedBox(height: 8),
          Text(
            featureDescription,
            style: PhinexaFont.contentRegular,
            overflow: TextOverflow.fade,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
