import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../core/route/route_name.dart';
import '../../../data/event.dart';

class EventCardWidget extends ConsumerWidget {
  final Event event;

  const EventCardWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 16),
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
              child: Image.asset(
                event.image,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 100),
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
                        DateFormat('MMMM d, yyyy').format(event.startDate),
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
                        getEventTime(event.startDate, event.endDate),
                        style: PhinexaFont.labelRegular.copyWith(
                          color: PhinexaColor.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(RouteName.eventDetails, extra: event);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PhinexaColor.primaryColor,
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: Text(
                      'Explore More',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getEventTime(DateTime startDate, DateTime endDate) {
    final DateFormat timeFormatter = DateFormat('hh:mm a');
    return '${timeFormatter.format(startDate)} - ${timeFormatter.format(endDate)}';
  }
}
