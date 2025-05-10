// lib/feature/other/presentation/ui/widget/map_view_widget.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
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
  final Set<Polygon> _countryPolygons = {};

  // 15-color rainbow palette
  static const List<Color> _rainbow = [
    Color(0xFFFF6B6B), // Soft Red
    Color(0xFFFF8C42), // Orange
    Color(0xFFFFC857), // Warm Yellow
    Color(0xFFf9a43f), // Light Green
    Color(0xFF01B0DC),
    Color(0xFFFFC857), // Rich Green
    Color(0xFF00B4D8),
    Color(0xFF5ac9c9), // Soft Red
    Color(0xFFFFFFFF),
    Color(0xFFFFC857), // Warm Yellow// Aqua Blue
    Color(0xFFB5E48C),
    Color(0xFFFFC857),
    Color(0xFF70E000), // Bright Green
    Color(0xFFFF6B6B), // Soft Red
    Color(0xFFFF8C42),
    Color(0xFFFF8C42),
    Color(0xFFf9a43f), // Light Green
    Color(0xFF5ac9c9), // Pink
    Color(0xFF59a8f7), // Soft Cyan
    // Pure White
  ];

  @override
  void initState() {
    super.initState();
    _loadCountryPolygons();
  }

  Future<void> _loadCountryPolygons() async {
    final raw = await rootBundle.loadString('assets/more/countries.geojson');
    final geo = json.decode(raw) as Map<String, dynamic>;
    final count = (geo['features'] as List).length;
    debugPrint('▶️ GeoJSON has $count features');

    int idCounter = 0;
    for (final feature in geo['features'] as List) {
      final props = feature['properties'] as Map<String, dynamic>;
      final countryCode = props['ISO_A2'] as String? ??
          props['ADM0_A3'] as String? ??
          'C$idCounter';

      final geometry = feature['geometry'] as Map<String, dynamic>;
      final coords = geometry['coordinates'];

      // choose one of 15 rainbow colors
      final color = _rainbow[idCounter % _rainbow.length];

      if (geometry['type'] == 'Polygon') {
        _addPolygon(coords as List, countryCode, color, idCounter++);
      } else if (geometry['type'] == 'MultiPolygon') {
        for (final poly in coords as List) {
          _addPolygon(poly as List, countryCode, color, idCounter++);
        }
      }
    }

    setState(() {});
  }

  /// Now handles holes! rings[0] = outer boundary; rings[1..] = holes
  void _addPolygon(
    List<dynamic> rings,
    String countryCode,
    Color color,
    int idx,
  ) {
    // Outer ring → polygon.points
    final outer = rings[0] as List;
    final outerPoints = outer.map<LatLng>((pt) {
      final lng = (pt[0] as num).toDouble();
      final lat = (pt[1] as num).toDouble();
      return LatLng(lat, lng);
    }).toList();

    // Any subsequent ring is a “hole”
    final holes = <List<LatLng>>[];
    for (var i = 1; i < rings.length; i++) {
      final holeRing = rings[i] as List;
      final holePoints = holeRing.map<LatLng>((pt) {
        final lng = (pt[0] as num).toDouble();
        final lat = (pt[1] as num).toDouble();
        return LatLng(lat, lng);
      }).toList();
      holes.add(holePoints);
    }

    _countryPolygons.add(
      Polygon(
        polygonId: PolygonId('$countryCode-$idx'),
        points: outerPoints,
        holes: holes,
        strokeColor: Colors.transparent,
        fillColor: color,
        strokeWidth: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPosition = ref.watch(selectedLocationProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_mapController != null) {
        _mapController!.animateCamera(
          CameraUpdate.newLatLngZoom(currentPosition, 5),
        );
      }
    });

    return GoogleMap(
      style: mapStyle,
      initialCameraPosition:
          const CameraPosition(target: LatLng(7.8731, 80.7718), zoom: 5),
      polygons: _countryPolygons,
      onMapCreated: (c) => _mapController = c,
      onTap: (latLng) async => _handleTap(latLng, context),
    );
  }

  Future<void> _handleTap(LatLng latLng, BuildContext context) async {
    try {
      final placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks.isEmpty) return;

      final country = placemarks.first.country;
      if (country == null) return;

      final sipDetail = ref.watch(sipDetailByCountryProvider(country));
      if (sipDetail != null) {
        showModalBottomSheet(
          context: context,
          builder: (_) => CountryBottomSheet(sipDetail: sipDetail),
        );
      }

      final locations = await locationFromAddress(country);
      if (locations.isNotEmpty && _mapController != null) {
        final loc = locations.first;
        _mapController!.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(loc.latitude, loc.longitude),
            5,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error on tap: $e');
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
