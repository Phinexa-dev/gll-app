import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../domain/model/testimonial/testimonial.dart';

class TestomonialWidget extends ConsumerWidget {
  final Testimonial testimonial;

  const TestomonialWidget({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: testimonial.imageUrl.isNotEmpty
                    ? NetworkImage(testimonial.imageUrl)
                    : AssetImage('assets/more/profile_placeholder.png')
                          as ImageProvider,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      testimonial.role,
                      style: PhinexaFont.cardTipEmphasis.copyWith(
                        color: PhinexaColor.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(testimonial.feedback, style: PhinexaFont.labelRegular),
        ],
      ),
    );
  }
}
