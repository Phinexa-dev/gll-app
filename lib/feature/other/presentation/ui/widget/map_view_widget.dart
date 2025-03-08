import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:gll/feature/other/domain/model/sip/sip_detail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/local/map_custom_style.dart';
import '../provider/location_provider.dart';
import '../provider/sip_details_provider.dart';
import 'country_sip_detail_bottom_sheet_widget.dart';

class MapViewWidget extends ConsumerStatefulWidget {
  const MapViewWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends ConsumerState<MapViewWidget> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentPosition = ref.watch(selectedLocationProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(currentPosition, 5),
      );
    });

    return GoogleMap(
      style: mapStyle,
      initialCameraPosition:
          CameraPosition(target: LatLng(7.8731, 80.7718), zoom: 5),
      onMapCreated: (controller) {
        _mapController = controller;
      },
      onTap: (LatLng latLng) async {
        await _getCountryName(latLng, context);
      },
    );
  }

  void _showCountryBottomSheet(BuildContext context, SipDetail sipDetail) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CountryBottomSheet(sipDetail: sipDetail);
      },
    );
  }

  Future<void> _getCountryName(LatLng latLng, BuildContext context) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      if (placemarks.isNotEmpty && placemarks.first.country != null) {
        String country = placemarks.first.country!;
        print("You clicked in: $country");

        final sipDetail = ref.watch(sipDetailByCountryProvider(country));

        if (sipDetail != null) {
          _showCountryBottomSheet(context, sipDetail);
        } else {
          print('No SIP found for this country');
        }

        List<Location> locations = await locationFromAddress(country);

        if (locations.isNotEmpty) {
          double lat = locations.first.latitude;
          double lng = locations.first.longitude;

          LatLng countryLatLng = LatLng(lat, lng);

          if (_mapController != null) {
            _mapController!.animateCamera(
              CameraUpdate.newLatLngZoom(countryLatLng, 5), // Set zoom level
            );
          }

          print("Coordinates for $country: Latitude: $lat, Longitude: $lng");
        } else {
          print("No results found for $country.");
        }
      } else {
        print("No country found for this location.");
      }
    } catch (e) {
      print("Error getting country name: $e");
    }
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
