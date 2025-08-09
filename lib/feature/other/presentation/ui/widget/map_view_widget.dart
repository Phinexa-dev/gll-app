import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../provider/country_sip_detail_provider.dart';
import '../provider/location_provider.dart';
import 'country_sip_detail_bottom_sheet_widget.dart';

class MapViewWidget extends ConsumerStatefulWidget {
  const MapViewWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MapViewWidgetState();
}

class MapViewWidgetState extends ConsumerState<MapViewWidget> {
  MapController? _mapController;
  bool _isLoading = false;
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
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _handleLocationSelection(LatLng latLng) async {
    // Prevent duplicate executions
    if (_isLoading) {
      debugPrint("Execution blocked: An operation is already in progress.");
      return;
    }

    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    try {
      debugPrint('Starting location selection for: $latLng');

      // Move the map if location is different
      if (_lastProcessedLatLng != latLng) {
        await _moveMapSilently(latLng);
        _lastProcessedLatLng = latLng;
      }

      if (!mounted) return;

      // Get country details
      final countrySipBasicDetails = ref.read(
        countryBasicDetailsByLatLngProvider(latLng),
      );

      if (countrySipBasicDetails != null) {
        debugPrint(
          'Showing bottom sheet for: ${countrySipBasicDetails.countryName}',
        );

        await showModalBottomSheet(
          context: context,
          isDismissible: true,
          enableDrag: true,
          builder: (_) => CountryBottomSheet(
            countrySipBasicDetails: countrySipBasicDetails,
          ),
        );

        debugPrint('Bottom sheet closed.');
      } else {
        debugPrint('No SIP detail found for the selected coordinates.');
      }
    } catch (e) {
      debugPrint('Error in _handleLocationSelection: $e');
    } finally {
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

  // Public method that can be called from parent widgets
  void handleTap(LatLng latLng, {String source = 'unknown'}) {
    if (_isLoading) {
      debugPrint("Tap ignored - operation in progress");
      return;
    }

    debugPrint("Handling tap from $source: $latLng");

    // Update location provider first
    ref.read(selectedLocationProvider.notifier).updateLocation(latLng);

    // Then handle the location selection directly (bypassing the listener)
    _handleLocationSelection(latLng);
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
            onTap: (tapPosition, latLng) {
              handleTap(latLng, source: 'map');
            },
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.maptiler.com/maps/basic/{z}/{x}/{y}.png?key=ApNIW6xnmjTjofxTMiPC',
              userAgentPackageName: 'com.yourcompany.app_name',
            ),
            MarkerLayer(
              markers: _countries.map((country) {
                final countryLatLng = country['latLng'] as LatLng;
                return Marker(
                  point: countryLatLng,
                  width: 30.0,
                  height: 30.0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      handleTap(
                        countryLatLng,
                        source: 'marker-${country['name']}',
                      );
                    },
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
