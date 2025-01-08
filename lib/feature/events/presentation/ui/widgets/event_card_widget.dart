import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:intl/intl.dart';

import '../screen/events_screen.dart';

class EventCardWidget extends ConsumerWidget {
  final Event event;

  const EventCardWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 16.0,bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: PhinexaColor.lightGrey),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 0),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
              child: Image.network(
                event.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: PhinexaFont.highlightEmphasis,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 16.0,
                        color: PhinexaColor.darkGrey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        DateFormat('MMMM d, yyyy').format(event.date),
                        style: PhinexaFont.labelRegular.copyWith(
                          color: PhinexaColor.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16.0,
                        color: PhinexaColor.darkGrey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        getEventTime(event.date,event.duration),
                        style: PhinexaFont.labelRegular.copyWith(
                          color: PhinexaColor.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     context.pushNamed(
                  //       RouteName.resourceMore,
                  //       extra: resource,
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: PhinexaColor.primaryColor,
                  //     minimumSize: Size(double.infinity, 30),
                  //   ),
                  //   child: Text(
                  //     'Read More',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getEventTime(DateTime date, int duration) {
    final DateFormat timeFormatter = DateFormat('hh:mm a');
    final DateTime endTime = date.add(Duration(hours: duration));
    return '${timeFormatter.format(date)} - ${timeFormatter.format(endTime)}';
  }

}
