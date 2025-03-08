import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../domain/model/sip/sip_detail.dart';

class SubEventWidget extends ConsumerWidget {
  final Sip sip;

  const SubEventWidget({
    super.key,
    required this.sip,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: '${sip.title} --', style: PhinexaFont.labelRegular),
                TextSpan(
                    text: '"${sip.quote}"', style: PhinexaFont.labelMedium),
                TextSpan(
                  text: ' - ${sip.description}',
                  style: PhinexaFont.labelRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
