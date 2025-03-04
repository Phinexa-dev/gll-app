import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/events/data/event.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/route/route_name.dart';
import 'custom_button.dart';

class EventViewScreenWidget extends ConsumerWidget {
  final Event event;

  const EventViewScreenWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: SingleChildScrollView(
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
          SizedBox(
            height: 24,
          ),
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
                SizedBox(
                  height: 12,
                ),
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
                SizedBox(
                  height: 24,
                ),
                Text(
                  event.subTitle,
                  style: PhinexaFont.headingMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                ...event.subEvents
                    .map((subEvent) =>
                        _buildSubEventComponent(context, subEvent))
                    .toList(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  event.ledBy,
                  style: PhinexaFont.highlightEmphasis
                      .copyWith(color: PhinexaColor.primaryLightBlue),
                ),
                if (true)
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        label: "Register Now",
                        height: 40,
                        onPressed: () {
                          context.pushNamed(RouteName.registrationForm, extra: {
                            'isTTT': event.isTTT ? true : false,
                            'eventIdentity':
                                '${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}',
                          });
                        },
                      ),
                    ],
                  ),
                if (true)
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        label: "Post Survey",
                        height: 40,
                        onPressed: () {
                          if (event.isTTT) {
                            context.pushNamed(
                                RouteName.tttOverallProgramFeedbackScreen,
                                extra:
                                    '${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}');
                          } else {
                            context.pushNamed(
                                RouteName.laOverallProgramFeedbackScreen,
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
      )),
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
