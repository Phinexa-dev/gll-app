// MapViewWidget.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

import '../provider/location_provider.dart';
import '../provider/sip_details_provider.dart';
import 'country_sip_detail_bottom_sheet_widget.dart';

// Define a GlobalKey for MapViewWidgetState
final GlobalKey<_MapViewWidgetState> mapViewKey = GlobalKey();

class MapViewWidget extends ConsumerStatefulWidget {
  const MapViewWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapViewWidgetState();
}

class _MapViewWidgetState extends ConsumerState<MapViewWidget> {
  MapController? _mapController;
  final Set<Polygon> _countryPolygons = {};

  bool _isLoading = false;

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
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  // Make this function public
  Future<void> showCountryDetailsAndMoveMap(String countryName) async {
    if (!mounted) return;
    setState(() {
      _isLoading = true; // Show loading indicator
    });
    try {
      final sipDetail = ref.read(sipDetailByCountryProvider(countryName));

      if (sipDetail != null) {
        if (!mounted) return;
        showModalBottomSheet(
          context: context,
          builder: (_) => CountryBottomSheet(sipDetail: sipDetail),
        );
      } else {
        debugPrint('No SIP detail found for $countryName.');
      }

      final locations = await locationFromAddress(countryName);
      if (locations.isNotEmpty && _mapController != null) {
        final loc = locations.first;
        _mapController!.move(LatLng(loc.latitude, loc.longitude), 5);
      } else {
        debugPrint(
            'Could not get location for $countryName or map controller is null.');
      }
    } catch (e) {
      debugPrint('Error showing country details for $countryName: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final googleMapsLatLng = ref.watch(selectedLocationProvider);
    final latlong2LatLng =
        LatLng(googleMapsLatLng.latitude, googleMapsLatLng.longitude);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_mapController != null && mounted) {
        _mapController!.move(latlong2LatLng, 5);
      }
    });

    return Stack(
      key: mapViewKey, // Assign the GlobalKey here
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: const LatLng(28.3949, 84.1240),
            initialZoom:
                4.0, // Increased initial zoom slightly for better visibility
            onTap: (tapPosition, latLng) async => _handleTap(latLng, context),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.yourcompany.app_name',
            ),
            PolygonLayer(
              polygons: _countryPolygons.toList(),
            ),
            // Add MarkerLayer here
            MarkerLayer(
              markers: _countries.map((country) {
                return Marker(
                  point: country['latLng'] as LatLng,
                  width: 80.0, // Adjust size as needed
                  height: 80.0, // Adjust size as needed
                  child: GestureDetector(
                    onTap: () {
                      showCountryDetailsAndMoveMap(country['name'] as String);
                    },
                    child: Image.asset('assets/more/place_marker.png'),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        AnimatedOpacity(
          opacity: _isLoading ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: IgnorePointer(
            ignoring: !_isLoading,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                      strokeWidth: 4,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Fetching details...',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleTap(LatLng latLng, BuildContext context) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks.isEmpty) {
        debugPrint('No placemarks found for tap location.');
        return;
      }

      final country = placemarks.first.country;
      if (country == null) {
        debugPrint('Country not found for tap location.');
        return;
      }

      debugPrint('Tapped on map at $latLng, resolved to country: $country');

      await showCountryDetailsAndMoveMap(country);
    } catch (e) {
      debugPrint('Error on map tap: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

// Your existing CampEvent, KeyObjective, SubEvent, Testimonial classes remain unchanged.
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
