import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

import '../provider/location_provider.dart';
import '../provider/sip_details_provider.dart';
import 'country_sip_detail_bottom_sheet_widget.dart';

class MapViewWidget extends ConsumerStatefulWidget {
  const MapViewWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends ConsumerState<MapViewWidget> {
  MapController? _mapController;
  // This is our single source of truth for locking
  bool _isLoading = false;
  late final ProviderSubscription<LatLng> _locationSubscription;
  LatLng? _lastProcessedLatLng;

  final List<Map<String, dynamic>> _countries = [
    {'name': 'Sri Lanka', 'latLng': LatLng(7.8731, 80.7718)},
    {'name': 'North Macedonia', 'latLng': LatLng(41.6086, 21.7453)},
    {'name': 'United States', 'latLng': LatLng(37.0902, -95.7129)},
    {'name': 'Hawaii', 'latLng': LatLng(21.3069, -157.8583)},
    {'name': 'Kosovo', 'latLng': LatLng(42.6026, 20.9030)},
    {'name': 'Nepal', 'latLng': LatLng(28.3949, 84.1240)},
  ];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    // The listener now correctly calls the existing _handleLocationSelection function.
    _locationSubscription =
        ref.listenManual(selectedLocationProvider, (previous, next) {
      if (mounted) {
        _handleLocationSelection(next);
      }
    });
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _locationSubscription.close();
    super.dispose();
  }

  Future<void> _handleLocationSelection(LatLng latLng) async {
    // 1. Strict Lock: If an operation is already running, do nothing.
    if (_isLoading) {
      debugPrint("Execution blocked: An operation is already in progress.");
      return;
    }

    // 2. Lock the process.
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    try {
      debugPrint('Starting location selection for: $latLng');

      // 3. Optimization: Only move the map if the location is different.
      if (_lastProcessedLatLng != latLng) {
        await _moveMapSilently(latLng);
        _lastProcessedLatLng = latLng;
      }

      String? countryName;
      try {
        final placemarks =
            await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
        if (placemarks.isNotEmpty && placemarks.first.country != null) {
          countryName = placemarks.first.country!;
        }
      } catch (e) {
        debugPrint('Error geocoding: $e');
      }

      if (!mounted) return;

      if (countryName != null) {
        final sipDetail = ref.read(sipDetailByCountryProvider(countryName));
        if (sipDetail != null) {
          debugPrint('Showing bottom sheet for: $countryName');

          await showModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,
            builder: (_) => CountryBottomSheet(sipDetail: sipDetail),
          );

          debugPrint('Bottom sheet closed.');
        } else {
          debugPrint('No SIP detail found for $countryName.');
        }
      }
    } catch (e) {
      debugPrint('Error in _handleLocationSelection: $e');
    } finally {
      // 4. ALWAYS unlock the process, allowing the next tap to work.
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        debugPrint('Operation finished. Lock released.');
      }
    }
  }

  Future<void> _moveMapSilently(LatLng latLng) async {
    if (_mapController == null) return;
    _mapController!.move(latLng, 5.0);
    await Future.delayed(const Duration(milliseconds: 300));
  }

  void _handleDirectUserTap(LatLng latLng) {
    ref.read(selectedLocationProvider.notifier).updateLocation(latLng);
  }

  @override
  Widget build(BuildContext context) {
    final LatLng initialMapCenter = ref.read(selectedLocationProvider);

    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: initialMapCenter,
            initialZoom: 6.0,
            minZoom: 3.0,
            maxZoom: 18.0,
            onTap: (tapPosition, latLng) => _handleDirectUserTap(latLng),
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=ApNIW6xnmjTjofxTMiPC',
              userAgentPackageName: 'com.yourcompany.app_name',
            ),
            MarkerLayer(
              markers: _countries.map((country) {
                return Marker(
                  point: country['latLng'] as LatLng,
                  width: 30.0,
                  height: 30.0,
                  child: GestureDetector(
                    onTap: () =>
                        _handleDirectUserTap(country['latLng'] as LatLng),
                    child: Image.asset(
                      'assets/more/place_marker.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ],
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

  Testimonial({
    required this.name,
    required this.role,
    required this.feedback,
    required this.imageUrl,
  });
}
