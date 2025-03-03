import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:gll/feature/events/presentation/ui/widgets/event_card_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../common/theme/fonts.dart';
import '../../../../../core/route/route_name.dart';
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventProvider); // Watch provider here
    _filteredEvents = _filteredEvents.isEmpty ? events : _filteredEvents;

    if (events.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No events available')),
      );
    }

    Event firstEvent = events.first;
    bool showFirstEvent = _filteredEvents.contains(firstEvent);

    List<Event> remainingEvents =
        _filteredEvents.where((event) => event != firstEvent).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Events', style: PhinexaFont.headingSmall),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      DateFormat('MMMM d, yyyy').format(firstEvent.startDate),
                      style: PhinexaFont.captionRegular
                          .copyWith(color: PhinexaColor.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      label: "Explore More",
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

                  // Render the remaining events
                  ...remainingEvents.map((event) {
                    return EventCardWidget(event: event);
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
