import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/event/domain/model/event/event_data_model.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../core/route/route_name.dart';
import 'custom_button.dart';

class EventViewScreenWidget extends ConsumerWidget {
  final EventDataModel event;

  const EventViewScreenWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var hasFilledPreSurvey = false;
    var hasFilledPostSurvey = false;

    if (event.userEvents.isNotEmpty) {
      hasFilledPreSurvey = event.userEvents.first.surveySubmitted;
      hasFilledPostSurvey = event.userEvents.first.postSurveySubmitted;
    }

    String eventDateIdentifier =
    (event.startDate.day == 1 && event.startDate.hour == 0)
        ? DateFormat('yyyy_MM').format(event.startDate)
        : DateFormat('yyyy_MM_dd').format(event.startDate);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Event Details',
              style: PhinexaFont.headingSmall.copyWith(color: PhinexaColor.black),
            ),
            backgroundColor: PhinexaColor.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: PhinexaColor.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        event.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.name,
                              style: PhinexaFont.featureAccent,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            if(event.subtitle.isNotEmpty) Text(
                              event.subtitle,
                              style: PhinexaFont.highlightRegular.copyWith(color: PhinexaColor.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),

                            const SizedBox(height: 12),
                            // Display formatted date and time
                            Text(
                              formatEventDateTime(event.startDate, event.endDate),
                              style: PhinexaFont.contentRegular
                                  .copyWith(color: PhinexaColor.darkGrey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Text(
                              event.location,
                              style: PhinexaFont.captionRegular
                                  .copyWith(color: PhinexaColor.darkGrey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 24),
                            if (event.description != null && event.description!.isNotEmpty)
                              Text(
                                event.description!,
                                style: PhinexaFont.contentRegular.copyWith(color: PhinexaColor.black),
                              ),
                            if (!hasFilledPreSurvey)
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  CustomButton(
                                    label: "Register Now",
                                    height: 40,
                                    onPressed: () {
                                      context.pushNamed(
                                          RouteName.registrationForm,
                                          extra: {
                                            'isTTT': event.eventType =='TTT' ? true : false,
                                            'eventID': event.id
                                          });
                                    },
                                  ),
                                ],
                              ),
                            // Conditionally render Post Survey button
                            if (!hasFilledPostSurvey && hasFilledPreSurvey)
                              Column(
                                children: [
                                  const SizedBox(height: 20),
                                  CustomButton(
                                    label: "Post Survey",
                                    height: 40,
                                    onPressed: () {
                                      if (event.eventType=='TTT') {
                                        context.pushNamed(
                                            RouteName
                                                .tttOverallProgramFeedbackScreen,
                                            extra:
                                            event.id);
                                      } else {
                                        context.pushNamed(
                                            RouteName
                                                .laOverallProgramFeedbackScreen,
                                            extra:
                                                event.id);
                                      }
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              )
        );

  }
}

// Updated formatting function for the main event date/time
String formatEventDateTime(DateTime startDate, DateTime endDate) {
  // Check if a specific time is available
  bool hasTime = startDate.hour != 0 || startDate.minute != 0;

  // Check if a specific day is available
  bool hasDay = startDate.day != 1 || startDate.hour != 0;

  if (hasDay && hasTime) {
    // If day and time are available
    final dateFormat = DateFormat('MMM d, yyyy');
    final timeFormat = DateFormat('h:mm a');
    return "${dateFormat.format(startDate)}, ${timeFormat.format(startDate)} - ${timeFormat.format(endDate)}";
  } else if (hasDay) {
    // If only day is available (no time)
    final dateFormat = DateFormat('MMM d, yyyy');
    return dateFormat.format(startDate);
  } else {
    // If only month and year are available
    final dateFormat = DateFormat('MMMM, yyyy');
    return dateFormat.format(startDate);
  }
}

// Updated formatting function for sub-event date range
String formatSubEventDateRange(DateTime startDate, DateTime endDate) {
  // Check if a specific day is available
  bool hasDay = startDate.day != 1 || startDate.hour != 0;

  if (hasDay) {
    // If specific days are available
    final monthFormat = DateFormat('MMMM');
    final dayFormat = DateFormat('d');

    String formattedMonth = monthFormat.format(startDate);
    String formattedStartDay = dayFormat.format(startDate);
    String formattedEndDay = dayFormat.format(endDate);

    if (startDate.month == endDate.month) {
      // If start and end are in the same month
      return "$formattedMonth $formattedStartDay - $formattedEndDay : ";
    } else {
      // If start and end are in different months
      final endMonthFormat = DateFormat('MMMM');
      String formattedEndMonth = endMonthFormat.format(endDate);
      return "$formattedMonth $formattedStartDay - $formattedEndMonth $formattedEndDay : ";
    }
  } else {
    // If only month and year are available
    final monthFormat = DateFormat('MMMM');
    String formattedMonth = monthFormat.format(startDate);
    return "$formattedMonth : ";
  }
}
