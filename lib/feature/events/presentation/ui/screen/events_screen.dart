import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:gll/feature/events/presentation/ui/widgets/event_card_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../common/theme/fonts.dart';
import '../../../../../core/data/local/user/model/user_model.dart';
import '../../../../../core/data/local/user/user_service.dart';
import '../../../../../core/data/remote/network_service.dart';
import '../../../../../core/route/route_name.dart';
import '../../../application/survey_upload_service.dart';
import '../../../data/event.dart';
import '../../../data/event_provider.dart';
import '../widgets/search_bar_widget.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Event> _filteredEvents = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterEvents);
  }

  void _filterEvents() {
    final query = _searchController.text.toLowerCase();
    final allEvents = ref.read(eventProvider);
    setState(() {
      _filteredEvents = allEvents
          .where((event) => event.title.toLowerCase().contains(query))
          .toList();
    });
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

  String _getButtonTextForEvent(Event event, List<String> surveyNames) {
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dio = ref.watch(networkServiceProvider);
    final userFuture = ref.watch(userServiceProvider(dio)).getUser();
    final events = ref.watch(eventProvider);
    _filteredEvents = _filteredEvents.isEmpty ? events : _filteredEvents;

    if (events.isEmpty) {
      return const Scaffold(body: Center(child: Text('No events available')));
    }

    Event firstEvent = events.first;
    bool showFirstEvent = _filteredEvents.contains(firstEvent);

    List<Event> remainingEvents = _filteredEvents
        .where((event) => event != firstEvent)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Start Training', style: PhinexaFont.headingSmall),
        ),
      ),
      body: FutureBuilder<UserModel?>(
        future: userFuture,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userSnapshot.hasError || userSnapshot.data == null) {
            return const Center(child: Text('User not logged in.'));
          }

          final user = userSnapshot.data!;
          final surveyNamesFuture = retrieveSurveyNames(user.email);

          return FutureBuilder<List<String>>(
            future: surveyNamesFuture,
            builder: (context, surveySnapshot) {
              if (surveySnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final surveyNames = surveySnapshot.data ?? [];

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          'assets/events/event_screen_bg.svg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: 'Ready to Register?',
                              style: PhinexaFont.featureEmphasis,
                            ),
                          ),
                          SizedBox(height: 16),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text:
                              'Scroll to find your event, tap Register, and answer a few quick questions—boom, you\'re in. Easy, breezy, all in the app.',
                              style: PhinexaFont.contentRegular,
                            ),
                          ),
                          SizedBox(height: 8),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text:
                              'After you register, you\'ll get a confirmation notice. Keep an eye out for updates, prep info, and helpful tips leading up to the big day.',
                              style: PhinexaFont.contentRegular,
                            ),
                          ),
                          SizedBox(height: 16),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: 'Your leadership journey starts here—let\'s go!',
                              style: PhinexaFont.highlightRegular,
                            ),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                    SearchBarWidget(controller: _searchController),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (showFirstEvent) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                firstEvent.image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 100),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              firstEvent.title,
                              style: PhinexaFont.featureEmphasis,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Text(
                              _formatDate(firstEvent.startDate, firstEvent.endDate),
                              style: PhinexaFont.captionRegular.copyWith(
                                color: PhinexaColor.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 12),
                            CustomButton(
                              label: _getButtonTextForEvent(firstEvent, surveyNames),
                              onPressed: () {
                                context.pushNamed(
                                  RouteName.eventDetails,
                                  extra: firstEvent,
                                );
                              },
                              height: 40,
                            ),
                            const SizedBox(height: 12),
                          ],
                          ...remainingEvents.map((event) {
                            return EventCardWidget(
                              event: event,
                              surveyNames: surveyNames,
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

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