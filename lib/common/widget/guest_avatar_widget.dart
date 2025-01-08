import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class GuestAvatarWidget extends ConsumerWidget {
  final String imageUrl;
  final String guestName;

  const GuestAvatarWidget({
    super.key,
    required this.imageUrl,
    required this.guestName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 24),
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 96,
              height: 96,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return SizedBox(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.broken_image,
                size: 40,
              ),
            ),
          ),
          SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: PhinexaFont.contentRegular,
              text: guestName,
            ),
          ),
          Text(
            "Guest",
            style: PhinexaFont.captionRegular.copyWith(color: PhinexaColor.darkGrey),
          ),
        ],
      ),
    );
  }
}
