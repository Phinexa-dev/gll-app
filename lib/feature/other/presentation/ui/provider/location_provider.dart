import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// A notifier class that manages the location state
class LocationNotifier extends StateNotifier<LatLng> {
  LocationNotifier() : super(LatLng(7.8731, 80.7718));

  void updateLocation(LatLng newLocation) {
    print(newLocation);
    state = newLocation;
  }
}

// StateNotifierProvider for LocationNotifier
final selectedLocationProvider =
    StateNotifierProvider<LocationNotifier, LatLng>((ref) {
  return LocationNotifier();
});
