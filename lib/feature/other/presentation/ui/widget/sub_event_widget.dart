import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/other/presentation/ui/widget/map_view_widget.dart';
import 'package:intl/intl.dart';

class SubEventWidget extends ConsumerWidget {
  final SubEvent subEvent;

  const SubEventWidget({
    super.key,
    required this.subEvent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              child: Image.network(
                subEvent.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    height: 100,
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
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 100),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: subEvent.profileImage.isNotEmpty
                    ? NetworkImage(subEvent.profileImage)
                    : AssetImage('assets/more/profile_placeholder.png')
                        as ImageProvider,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    subEvent.targetAudience,
                    style: PhinexaFont.labelRegular
                        .copyWith(color: PhinexaColor.darkGrey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              Text(
                DateFormat('MMMM d, yyyy').format(subEvent.date),
                style: PhinexaFont.labelRegular
                    .copyWith(color: PhinexaColor.darkGrey),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            subEvent.title,
            style: PhinexaFont.headingMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            subEvent.description,
            style:
                PhinexaFont.labelRegular.copyWith(color: PhinexaColor.darkGrey),
          )
        ],
      ),
    );
  }
}
