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
import '../widgets/search_bar_widget.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  final List<Event> events = [
    Event(
      title: 'Sustainable Development Goals in Action',
      date: DateTime.now(),
      duration: 8,
      imagePath:
          'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Event(
      title: 'Climate Action for Change',
      date: DateTime.now(),
      duration: 5,
      imagePath:
          'https://images.unsplash.com/photo-1689273589847-45c3bc959ae3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Event(
      title: 'Innovation in Education',
      date: DateTime.now(),
      duration: 12,
      imagePath:
          'https://images.unsplash.com/photo-1519338381761-c7523edc1f46?q=80&w=1954&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ];

  String imageUrl =
      "https://plus.unsplash.com/premium_photo-1679547202264-83040062e1b2?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Events',
          style: PhinexaFont.headingSmall,
        )),
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
            SearchBarWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return SizedBox(
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Leadership Academy',
                    style: PhinexaFont.featureEmphasis,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    DateFormat('MMMM d, yyyy').format(DateTime.now()),
                    style: PhinexaFont.captionRegular
                        .copyWith(color: PhinexaColor.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomButton(
                      label: "Explore More",
                      onPressed: () {
                        context.pushNamed(RouteName.eventDetails);
                      },
                      height: 40),
                  SizedBox(
                    height: 12,
                  ),
                  ...events.map((event) {
                    return EventCardWidget(event: event);
                  }).toList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final DateTime date;
  final int duration;
  final String imagePath;

  Event({
    required this.title,
    required this.date,
    required this.duration,
    required this.imagePath,
  });
}
