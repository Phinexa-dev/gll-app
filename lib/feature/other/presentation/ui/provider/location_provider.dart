import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class LocationNotifier extends StateNotifier<LatLng> {
  LocationNotifier() : super(const LatLng(7.8731, 80.7718));

  void updateLocation(LatLng newLocation) {
    print(newLocation);
    state = newLocation;
  }
}

final selectedLocationProvider =
    StateNotifierProvider<LocationNotifier, LatLng>((ref) {
      return LocationNotifier();
    });
