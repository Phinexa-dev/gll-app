import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class FeatureCardWidget extends ConsumerWidget {
  final String iconPath;
  final String featureTitle;
  final String featureDescription;

  const FeatureCardWidget({
    super.key,
    required this.iconPath,
    required this.featureTitle,
    required this.featureDescription,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: PhinexaColor.extraLightBlue,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 28,
            width: 28,
          ),
          SizedBox(height: 20),
          Text(featureTitle, style: PhinexaFont.contentAccent),
          SizedBox(height: 8),
          Text(
            featureDescription,
            style: PhinexaFont.captionRegular.copyWith(color: PhinexaColor.lightBlue,),
            overflow: TextOverflow.fade,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}


