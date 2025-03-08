import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/events/data/event.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/data/local/user/model/user_model.dart';
import '../../core/data/local/user/user_service.dart';
import '../../core/route/route_name.dart';
import '../../feature/events/application/survey_upload_service.dart';
import 'custom_button.dart';

class EventViewScreenWidget extends ConsumerWidget {
  final Event event;

  const EventViewScreenWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userFuture = ref.watch(userServiceProvider).getUser();

    return FutureBuilder<UserModel?>(
      future: userFuture,
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (userSnapshot.hasError || userSnapshot.data == null) {
          return Center(child: Text("User not logged in."));
        }

        final user = userSnapshot.data!;
        final userEmail = user.email;

        if (userEmail == null) {
          return Center(child: Text("User email not found."));
        }

        // Retrieve survey names for the current user
        final surveyNamesFuture = _getUserSurveyNames(ref, userEmail);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: PhinexaColor.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: PhinexaColor.black),
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
                return Center(child: CircularProgressIndicator());
              }

              // Handle error for survey names
              if (surveySnapshot.hasError) {
                return Center(child: Text("Failed to load survey data."));
              }

              final surveyNames = surveySnapshot.data ?? [];

              // Generate the survey names for this event
              final preSurveyName =
                  'Pre_Survey_${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}';
              final postSurveyName =
                  'Post_Survey_${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}';

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
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: PhinexaFont.headingDoubleExLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(height: 12),
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
                          SizedBox(height: 24),
                          Text(
                            event.subTitle,
                            style: PhinexaFont.headingMedium,
                          ),
                          SizedBox(height: 10),
                          ...event.subEvents
                              .map((subEvent) =>
                                  _buildSubEventComponent(context, subEvent))
                              .toList(),
                          SizedBox(height: 10),
                          Text(
                            event.ledBy,
                            style: PhinexaFont.highlightEmphasis
                                .copyWith(color: PhinexaColor.primaryLightBlue),
                          ),
                          if (!hasFilledPreSurvey)
                            Column(
                              children: [
                                SizedBox(height: 20),
                                CustomButton(
                                  label: "Register Now",
                                  height: 40,
                                  onPressed: () {
                                    context.pushNamed(
                                        RouteName.registrationForm,
                                        extra: {
                                          'isTTT': event.isTTT ? true : false,
                                          'eventIdentity':
                                              '${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}',
                                        });
                                  },
                                ),
                              ],
                            ),
                          // Conditionally render Pre Survey button
                          if (!hasFilledPostSurvey && hasFilledPreSurvey)
                            Column(
                              children: [
                                SizedBox(height: 20),
                                CustomButton(
                                  label: "Post Survey",
                                  height: 40,
                                  onPressed: () {
                                    if (event.isTTT) {
                                      context.pushNamed(
                                          RouteName
                                              .tttOverallProgramFeedbackScreen,
                                          extra:
                                              '${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}');
                                    } else {
                                      context.pushNamed(
                                          RouteName
                                              .laOverallProgramFeedbackScreen,
                                          extra:
                                              '${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}');
                                    }
                                  },
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
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

String formatEventDateTime(DateTime startDate, DateTime endDate) {
  final dateFormat = DateFormat('MMM d, yyyy');
  final timeFormat = DateFormat('h:mm a');

  String formattedDate = dateFormat.format(startDate);
  String formattedStartTime = timeFormat.format(startDate);
  String formattedEndTime = timeFormat.format(endDate);

  return "$formattedDate, $formattedStartTime - $formattedEndTime";
}

String formatSubEventDateRange(DateTime startDate, DateTime endDate) {
  final monthFormat = DateFormat('MMMM');
  final dayFormat = DateFormat('d');

  String formattedMonth = monthFormat.format(startDate);
  String formattedStartDay = dayFormat.format(startDate);
  String formattedEndDay = dayFormat.format(endDate);

  return "$formattedMonth $formattedStartDay - $formattedEndDay : ";
}

Future<List<String>> _getUserSurveyNames(WidgetRef ref, String email) async {
  try {
    return await retrieveSurveyNames(ref, email);
  } catch (error) {
    print("Failed to retrieve survey names: $error");
    return [];
  }
}
