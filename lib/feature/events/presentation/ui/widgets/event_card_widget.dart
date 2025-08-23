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
  final List<String> surveyNames;

  const EventCardWidget({
    super.key,
    required this.event,
    required this.surveyNames
  });

  String _formatDate(DateTime startDate, DateTime endDate) {
    final dateFormat = DateFormat('MMMM d, yyyy');

    if (startDate.year == endDate.year &&
        startDate.month == endDate.month &&
        startDate.day == endDate.day) {
      return dateFormat.format(startDate);
    } else {
      final startDay = DateFormat('MMMM d').format(startDate);
      final endDay = DateFormat('d, yyyy').format(endDate);
      return '$startDay-$endDay';
    }
  }

  String _getEventTime(DateTime startDate, DateTime endDate) {
    if (startDate.hour == 0 &&
        startDate.minute == 0 &&
        endDate.hour == 0 &&
        endDate.minute == 0) {
      return '';
    } else {
      final DateFormat timeFormatter = DateFormat('hh:mm a');
      return '${timeFormatter.format(startDate)} - ${timeFormatter.format(endDate)}';
    }
  }

  String getEventDateIdentifier(DateTime startDate) {
    return (startDate.day == 1 && startDate.hour == 0)
        ? DateFormat('yyyy_MM').format(startDate)
        : DateFormat('yyyy_MM_dd').format(startDate);
  }

  String getPreSurveyName(Event event) {
    final String eventDateIdentifier = getEventDateIdentifier(event.startDate);
    return 'Pre_Survey_${event.title}_$eventDateIdentifier';
  }

  String getPostSurveyName(Event event) {
    final String eventDateIdentifier = getEventDateIdentifier(event.startDate);
    return 'Post_Survey_${event.title}_$eventDateIdentifier';
  }

  String _getButtonText() {
    final preSurveyName = getPreSurveyName(event);
    final postSurveyName = getPostSurveyName(event);

    final hasFilledPreSurvey = surveyNames.contains(preSurveyName);
    final hasFilledPostSurvey = surveyNames.contains(postSurveyName);

    if (!hasFilledPreSurvey && !hasFilledPostSurvey) {
      return "Register Here";
    } else if (hasFilledPreSurvey && !hasFilledPostSurvey) {
      return "Complete Post Survey";
    } else {
      return "Explore More";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SubEvent? firstSubEvent = event.subEvents.isNotEmpty
        ? event.subEvents.first
        : null;

    if (firstSubEvent == null) {
      return const SizedBox.shrink();
    }

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
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_rounded,
                        size: 16.0,
                        color: PhinexaColor.darkGrey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatDate(
                          firstSubEvent.startDate,
                          firstSubEvent.endDate,
                        ),
                        style: PhinexaFont.labelRegular.copyWith(
                          color: PhinexaColor.darkGrey,
                        ),
                      ),
                    ],
                  ),
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
                    child: Text(
                      _getButtonText(),
                      style: const TextStyle(color: Colors.white),
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