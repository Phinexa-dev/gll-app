import 'dart:async'; // Added for Timer

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
  final Set<Polygon> _countryPolygons = {};
  bool _isLoading = false;
  bool _isBottomSheetOpen = false;
  late final ProviderSubscription<LatLng> _locationSubscription;

  LatLng? _lastProcessedLatLng;
  Timer? _debounceTimer;

  int _executionId = 0;

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

    _locationSubscription =
        ref.listenManual(selectedLocationProvider, (previous, next) async {
      if (!mounted) return;

      debugPrint('Provider updated: $next');
      _debouncedLocationHandler(next);
    });
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _locationSubscription.close();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _debouncedLocationHandler(LatLng latLng) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 100), () {
      if (mounted) {
        _handleLocationSelection(latLng);
      }
    });
  }

  Future<void> _handleLocationSelection(LatLng latLng) async {
    if (!mounted) return;

    if (_lastProcessedLatLng == latLng || _isLoading || _isBottomSheetOpen) {
      debugPrint(
          'Skipping location selection: same location=${_lastProcessedLatLng == latLng}, loading=$_isLoading, bottomSheet=$_isBottomSheetOpen');
      return;
    }

    final currentExecutionId = ++_executionId;
    _lastProcessedLatLng = latLng;

    debugPrint(
        'Starting location selection for: $latLng (ID: $currentExecutionId)');

    setState(() {
      _isLoading = true;
    });

    try {
      if (currentExecutionId != _executionId) {
        debugPrint(
            'Execution $currentExecutionId cancelled, newer execution in progress');
        return;
      }

      await _moveMapSilently(latLng);

      if (currentExecutionId != _executionId || !mounted) {
        debugPrint('Execution $currentExecutionId cancelled after map move');
        return;
      }

      String? countryName;
      try {
        final placemarks =
            await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
        if (placemarks.isNotEmpty && placemarks.first.country != null) {
          countryName = placemarks.first.country!;
        }
      } catch (e) {
        debugPrint('Error resolving country name for $latLng: $e');
      }

      if (currentExecutionId != _executionId || !mounted) {
        debugPrint('Execution $currentExecutionId cancelled after geocoding');
        return;
      }

      if (countryName != null && !_isBottomSheetOpen) {
        final sipDetail = ref.read(sipDetailByCountryProvider(countryName));
        if (sipDetail != null) {
          _isBottomSheetOpen = true;
          debugPrint(
              'Showing bottom sheet for: $countryName (ID: $currentExecutionId)');

          await showModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,
            builder: (_) => CountryBottomSheet(sipDetail: sipDetail),
          );

          if (mounted) {
            _isBottomSheetOpen = false;
            debugPrint('Bottom sheet closed (ID: $currentExecutionId)');
          }
        } else {
          debugPrint('No SIP detail found for $countryName.');
        }
      }
    } catch (e) {
      debugPrint('Error in _handleLocationSelection for $latLng: $e');
    } finally {
      if (mounted && currentExecutionId == _executionId) {
        setState(() {
          _isLoading = false;
        });
        debugPrint('Completed location selection (ID: $currentExecutionId)');
      }
    }
  }

  Future<void> _moveMapSilently(LatLng latLng) async {
    if (_mapController == null) return;

    if (_mapController!.camera.center != latLng) {
      _mapController!.move(latLng, 5.0);
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  Future<void> _handleDirectUserTap(LatLng latLng) async {
    // This now simply updates the provider, and the debounced listener handles the rest.
    // This is safer as it centralizes all the complex logic in _handleLocationSelection.
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
            onTap: (tapPosition, latLng) => _handleDirectUserTap(latLng),
            onMapReady: () {},
          ),
          children: [
            //  urlTemplate:
            //                   'https://maps.geoapify.com/v1/tile/osm-bright-smooth/{z}/{x}/{y}.png',
            TileLayer(
              urlTemplate:
                  'https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=ApNIW6xnmjTjofxTMiPC',
              userAgentPackageName: 'com.yourcompany.app_name',
            ),
            PolygonLayer(
              polygons: _countryPolygons.toList(),
            ),
            MarkerLayer(
              markers: _countries.map((country) {
                return Marker(
                  point: country['latLng'] as LatLng,
                  width: 30.0, // Increased width to accommodate text
                  height: 30.0, // Increased height to accommodate text
                  child: GestureDetector(
                    onTap: () =>
                        _handleDirectUserTap(country['latLng'] as LatLng),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Wrap content tightly
                      children: [
                        Expanded(
                          // Image takes available space within the column
                          child: Image.asset(
                            'assets/more/place_marker.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 2.0), // Small space above text
                        //   child: Text(
                        //     country['name'] as String,
                        //     textAlign: TextAlign.center,
                        //     style: const TextStyle(
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 12, // Adjust font size as needed
                        //       shadows: [
                        //         Shadow(
                        //           blurRadius: 5.0,
                        //           color: Colors.white,
                        //           offset: Offset(1.0, 1.0),
                        //         ),
                        //       ],
                        //     ),
                        //     overflow: TextOverflow.ellipsis,
                        //     maxLines: 2,
                        //   ),
                        // ),
                      ],
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
