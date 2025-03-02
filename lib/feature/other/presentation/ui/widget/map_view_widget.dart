import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/presentation/ui/provider/events_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/local/map_custom_style.dart';
import '../provider/location_provider.dart';
import 'event_bottom_sheet_content.dart';

class MapViewWidget extends ConsumerStatefulWidget {
  const MapViewWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends ConsumerState<MapViewWidget> {
  late BitmapDescriptor customMarker;
  final Set<Marker> _markers = {};
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  Future<void> _loadCustomMarker() async {
    customMarker =
        await createCustomMarker('assets/more/map_marker.png', width: 70);
    _generateMarkersFromEvents(); // Generate markers after loading the custom marker
  }

  Future<BitmapDescriptor> createCustomMarker(String imagePath,
      {int width = 50}) async {
    final imageConfig =
        ImageConfiguration(size: Size(width.toDouble(), width.toDouble()));
    return BitmapDescriptor.asset(imageConfig, imagePath);
  }

  void _generateMarkersFromEvents() {
    final eventList = ref.read(eventListProvider);

    setState(() {
      for (var event in eventList) {
        _markers.add(
          Marker(
            markerId: MarkerId(event.id),
            icon: customMarker,
            position: event.latLng,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return EventBottomSheetContent(event: event);
                },
              );
            },
            infoWindow: InfoWindow(
              title: event.title,
              snippet: event.location,
              onTap: () {
                // Action when InfoWindow is tapped
                print('InfoWindow for ${event.title} tapped!');
              },
            ),
          ),
        );
      }
    });
  }

  void _moveCamera(LatLng position) {
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(position),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPosition = ref.watch(selectedLocationProvider);

    // Update the camera position when the current position changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moveCamera(currentPosition);
    });

    return GoogleMap(
      style: mapStyle,
      initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962), zoom: 15),
      markers: _markers,
      onMapCreated: (controller) {
        _mapController = controller;
      },
    );
  }
}

class CampEvent {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<KeyObjective> keyObjectives;
  final List<SubEvent> subEvents;
  final List<Testimonial> testimonials;
  final String location;
  final LatLng latLng;
  final DateTime startDate;
  final DateTime endDate;

  CampEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.keyObjectives,
    required this.subEvents,
    required this.testimonials,
    required this.location,
    required this.latLng,
    required this.startDate,
    required this.endDate,
  });
}

class KeyObjective {
  final String title;
  final String description;

  KeyObjective({
    required this.title,
    required this.description,
  });
}

class SubEvent {
  final String title;
  final String description;
  final String imageUrl;
  final String profileImage;
  final String targetAudience;
  final DateTime date;

  SubEvent({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.profileImage,
    required this.targetAudience,
    required this.date,
  });
}

class Testimonial {
  final String name;
  final String role;
  final String feedback;
  final String imageUrl;

  Testimonial(
      {required this.name,
      required this.role,
      required this.feedback,
      required this.imageUrl});
}
