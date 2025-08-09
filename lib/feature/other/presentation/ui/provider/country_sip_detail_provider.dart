import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/model/camp_event/camp_event_model.dart';
import 'package:latlong2/latlong.dart';

final countrySipBasicDetailsProvider = Provider<List<CountrySipBasicDetails>>((
  ref,
) {
  return [
    CountrySipBasicDetails(
      id: 'macedonia',
      countryName: 'North Macedonia',
      impactedNumber: 2000,
      numberOfSips: 15,
      onlyLaunched: false,
      latLng: LatLng(41.6086, 21.7453),
    ),

    CountrySipBasicDetails(
      id: 'sriLanka',
      countryName: 'Sri Lanka',
      impactedNumber: 400,
      numberOfSips: 10,
      onlyLaunched: false,
      latLng: LatLng(7.8731, 80.7718),
    ),

    CountrySipBasicDetails(
      id: 'hawaii',
      countryName: 'Hawaii',
      impactedNumber: 100,
      numberOfSips: 1,
      onlyLaunched: false,
      latLng: LatLng(21.3069, -157.8583),
    ),

    CountrySipBasicDetails(
      id: 'kosovo',
      countryName: 'Kosovo',
      impactedNumber: 0,
      numberOfSips: 0,
      onlyLaunched: true,
      latLng: LatLng(42.6026, 20.903),
    ),
    CountrySipBasicDetails(
      id: 'nepal',
      countryName: 'Nepal',
      impactedNumber: 0,
      numberOfSips: 0,
      onlyLaunched: true,
      latLng: LatLng(28.3949, 84.124),
    ),

    CountrySipBasicDetails(
      id: 'unitedStates',
      countryName: 'United States',
      impactedNumber: 400, // Placeholder data
      numberOfSips: 1,
      onlyLaunched: false,
      latLng: LatLng(37.0902, -95.7129),
    ),
  ];
});

final countryBasicDetailsByLatLngProvider =
    Provider.family<CountrySipBasicDetails?, LatLng>((ref, latLng) {
      final sipDetails = ref.watch(countrySipBasicDetailsProvider);

      return sipDetails.firstWhere(
        (sipDetail) =>
            sipDetail.latLng.latitude == latLng.latitude &&
            sipDetail.latLng.longitude == latLng.longitude,
        orElse: () => throw Exception('No SIP found for this country'),
      );
    });
