import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/events/data/event.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/data/local/user/model/user_model.dart';
import '../../core/data/local/user/user_service.dart';
import '../../core/data/remote/network_service.dart';
import '../../core/route/route_name.dart';
import '../../feature/events/application/survey_upload_service.dart';
import 'custom_button.dart';

class EventViewScreenWidget extends ConsumerWidget {
  final Event event;

  const EventViewScreenWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dio = ref.watch(networkServiceProvider);
    final userFuture = ref.watch(userServiceProvider(dio)).getUser();

    return FutureBuilder<UserModel?>(
      future: userFuture,
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userSnapshot.hasError || userSnapshot.data == null) {
          return const Center(child: Text("User not logged in."));
        }

        final user = userSnapshot.data!;
        final userEmail = user.email;

        if (userEmail == null) {
          return const Center(child: Text("User email not found."));
        }

        // Retrieve survey names for the current user
        final surveyNamesFuture = _getUserSurveyNames(ref, userEmail);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: PhinexaColor.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: PhinexaColor.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: FutureBuilder<List<String>>(
            future: surveyNamesFuture,
            builder: (context, surveySnapshot) {
              // Handle loading state for survey names
              if (surveySnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              // Handle error for survey names
              if (surveySnapshot.hasError) {
                return const Center(child: Text("Failed to load survey data."));
              }

              final surveyNames = surveySnapshot.data ?? [];

              // Generate the survey names for this event
              // Note: The format is dependent on the `startDate` having a day.
              final String eventDateIdentifier =
                  (event.startDate.day == 1 && event.startDate.hour == 0)
                      ? DateFormat('yyyy_MM').format(event.startDate)
                      : DateFormat('yyyy_MM_dd').format(event.startDate);

              final preSurveyName =
                  'Pre_Survey_${event.title}_$eventDateIdentifier';
              final postSurveyName =
                  'Post_Survey_${event.title}_$eventDateIdentifier';

              // Check if the user has filled out the surveys
              final hasFilledPreSurvey = surveyNames.contains(preSurveyName);
              final hasFilledPostSurvey = surveyNames.contains(postSurveyName);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        event.image, // Change this to your asset path
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: PhinexaFont.headingMedium,
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
                            event.venue,
                            style: PhinexaFont.captionRegular
                                .copyWith(color: PhinexaColor.darkGrey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            event.subTitle,
                            style: PhinexaFont.headingMedium,
                          ),
                          const SizedBox(height: 10),
                          ...event.subEvents
                              .map((subEvent) =>
                                  _buildSubEventComponent(context, subEvent))
                              .toList(),
                          const SizedBox(height: 10),
                          // Text(
                          //   event.ledBy,
                          //   style: PhinexaFont.highlightEmphasis
                          //       .copyWith(color: PhinexaColor.primaryLightBlue),
                          // ),
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
                                          'isTTT': event.isTTT ? true : false,
                                          'eventIdentity':
                                              '${event.title}_$eventDateIdentifier',
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
                                    if (event.isTTT) {
                                      context.pushNamed(
                                          RouteName
                                              .tttOverallProgramFeedbackScreen,
                                          extra:
                                              '${event.title}_$eventDateIdentifier');
                                    } else {
                                      context.pushNamed(
                                          RouteName
                                              .laOverallProgramFeedbackScreen,
                                          extra:
                                              '${event.title}_$eventDateIdentifier');
                                    }
                                  },
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

Widget _buildSubEventComponent(BuildContext context, SubEvent subEvent) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: PhinexaFont.highlightRegular,
            children: [
              TextSpan(
                style: PhinexaFont.highlightRegular.copyWith(
                    color: PhinexaColor.primaryLightBlue,
                    fontWeight: FontWeight.bold),
                text: formatSubEventDateRange(
                    subEvent.startDate, subEvent.endDate),
              ),
              TextSpan(
                text: subEvent.description,
                style: PhinexaFont.highlightRegular
                    .copyWith(color: PhinexaColor.darkGrey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
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

Future<List<String>> _getUserSurveyNames(WidgetRef ref, String email) async {
  try {
    return await retrieveSurveyNames(email);
  } catch (error) {
    print("Failed to retrieve survey names: $error");
    return [];
  }
}
