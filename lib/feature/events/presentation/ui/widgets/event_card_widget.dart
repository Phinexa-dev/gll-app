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

  // Helper function to format the date string
  String _formatDate(DateTime date) {
    // Check if the day is not 1 and the time is not midnight.
    // This is how we can determine if a full date and time were provided.
    // The `DateTime(year, month)` constructor defaults to day 1, 00:00:00.
    if (date.day == 1 && date.hour == 0 && date.minute == 0) {
      // If only month and year are provided, format as "Month, yyyy"
      return DateFormat('MMMM, yyyy').format(date);
    } else {
      // If a specific day is provided, format as "Month day, yyyy"
      return DateFormat('MMMM d, yyyy').format(date);
    }
  }

  // Helper function to get the time range
  String _getEventTime(DateTime startDate, DateTime endDate) {
    // Check if the time is midnight, which indicates no specific time was set.
    if (startDate.hour == 0 &&
        startDate.minute == 0 &&
        endDate.hour == 0 &&
        endDate.minute == 0) {
      // If no specific time is provided, return an empty string or a message
      return ''; // Or you can return 'Time not specified'
    } else {
      // If a specific time is provided, format and return the time range
      final DateFormat timeFormatter = DateFormat('hh:mm a');
      return '${timeFormatter.format(startDate)} - ${timeFormatter.format(endDate)}';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the first sub-event to display its date and time
    final SubEvent? firstSubEvent = event.subEvents.isNotEmpty
        ? event.subEvents.first
        : null;

    if (firstSubEvent == null) {
      return const SizedBox.shrink(); // Hide card if no sub-events
    }

    // Determine if the time section should be visible
    final bool showTime =
        firstSubEvent.startDate.hour != 0 ||
        firstSubEvent.startDate.minute != 0;

    return Container(
      margin: const EdgeInsets.only(top: 16.0, bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: PhinexaColor.lightGrey),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 0),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
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
                  const SizedBox(height: 8.0),

                  // Date section
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_rounded,
                        size: 16.0,
                        color: PhinexaColor.darkGrey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatDate(firstSubEvent.startDate),
                        style: PhinexaFont.labelRegular.copyWith(
                          color: PhinexaColor.darkGrey,
                        ),
                      ),
                    ],
                  ),

                  // Time section, only show if time is specified
                  if (showTime) ...[
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16.0,
                          color: PhinexaColor.darkGrey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _getEventTime(
                            firstSubEvent.startDate,
                            firstSubEvent.endDate,
                          ),
                          style: PhinexaFont.labelRegular.copyWith(
                            color: PhinexaColor.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(RouteName.eventDetails, extra: event);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PhinexaColor.primaryColor,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text(
                      'Register Here',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
