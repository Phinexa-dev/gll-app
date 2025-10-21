import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:gll/feature/event/domain/model/event/event_data_model.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../common/theme/colors.dart';
import '../../../../../common/theme/fonts.dart';
import '../../../../../core/data/remote/network_service.dart';
import '../../../../../core/route/route_name.dart';
import '../../controller/event/event_controller.dart';
import '../widgets/event_card_widget.dart';
import '../widgets/search_bar_widget.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<EventDataModel> _filteredEvents = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterEvents);
    Future.microtask(
          () =>
          ref.read(eventControllerProvider.notifier).getEvents(),
    );
  }


  void _filterEvents() {
    final query = _searchController.text.toLowerCase();
    final eventState = ref.read(eventControllerProvider);
    setState(() {
      _filteredEvents = eventState.events
          .where((event) => event.name.toLowerCase().contains(query))
          .toList();
    });
  }


  String _getButtonTextForEvent(List<UserEventDataModel> userEventModel) {
    if(userEventModel.isEmpty){
      return "Register Now";
    }
    if (userEventModel.first.surveySubmitted ==false) {
      return "Register Now";
    } else if (userEventModel.first.postSurveySubmitted == false) {
      return "Complete Post Survey";
    } else {
      return "Explore More";
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dio = ref.watch(networkServiceProvider);
    final eventState = ref.watch(eventControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Start Training', style: PhinexaFont.headingSmall),
        ),
      ),
      body: eventState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : eventState.isFailure == true
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        eventState.errorMessage ?? 'Failed to load events',
                        style: PhinexaFont.contentRegular,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.read(eventControllerProvider.notifier).getEvents(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : eventState.events.isEmpty
                  ? const Center(child: Text('No events available'))
                  : _buildEventsList(eventState.events, dio),
    );
  }

  Widget _buildEventsList(List<EventDataModel> events, dio) {
    final displayEvents = _filteredEvents.isEmpty ? events : _filteredEvents;
    final firstEvent = displayEvents.first;
    final remainingEvents = displayEvents.skip(1).toList();

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
                        const SizedBox(height: 16),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: 'Scroll to find your event, tap Register, and answer a few quick questions—boom, you\'re in. Easy, breezy, all in the app.',
                            style: PhinexaFont.contentRegular,
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: 'After you register, you\'ll get a confirmation notice. Keep an eye out for updates, prep info, and helpful tips leading up to the big day.',
                            style: PhinexaFont.contentRegular,
                          ),
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: 'Your leadership journey starts here—let\'s go!',
                            style: PhinexaFont.highlightRegular,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  SearchBarWidget(controller: _searchController),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFeaturedEvent(firstEvent),
                        ...remainingEvents.map((event) => EventCardWidget(
                              event: event
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );

  }

  Widget _buildFeaturedEvent(EventDataModel event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            event.image,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 100),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          event.name,
          style: PhinexaFont.featureEmphasis,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Text(
          _formatDate(event.startDate, event.endDate),
          style: PhinexaFont.captionRegular.copyWith(
            color: PhinexaColor.grey,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 12),
        CustomButton(
          label: _getButtonTextForEvent(event.userEvents),
          onPressed: () {
            context.pushNamed(
              RouteName.eventDetails,
              extra: event,
            );
          },
          height: 40,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

