import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomDivider extends ConsumerWidget {

  final String label;
  final double thickness;
  final Color color;


  const CustomDivider({
    super.key,
    required this.label,
    this.thickness = 1,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: color.withAlpha(200),
            thickness: thickness,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            style: PhinexaFont.baseStyle.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: color.withAlpha(200),
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}
