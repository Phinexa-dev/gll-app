import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/location_provider.dart';

class CountryDropdownWidget extends ConsumerStatefulWidget {
  const CountryDropdownWidget({super.key});

  @override
  _CountryDropdownWidgetState createState() => _CountryDropdownWidgetState();
}

class _CountryDropdownWidgetState extends ConsumerState<CountryDropdownWidget> {
  String? _selectedCountry;
  final List<Map<String, dynamic>> _countries = [
    {'name': 'India', 'latLng': LatLng(20.5937, 78.9629)},
    {'name': 'United States', 'latLng': LatLng(37.0902, -95.7129)},
    {'name': 'Canada', 'latLng': LatLng(56.1304, -106.3468)},
    {'name': 'United Kingdom', 'latLng': LatLng(51.5074, -0.1278)},
    {'name': 'Australia', 'latLng': LatLng(-25.2744, 133.7751)},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: PhinexaColor.lighterGrey,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color: PhinexaColor.grey,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCountry,
          hint: Text(
            "Select a country",
            style:
                PhinexaFont.highlightRegular.copyWith(color: PhinexaColor.grey),
          ),
          borderRadius: BorderRadius.circular(15.0),
          style:
              PhinexaFont.contentRegular.copyWith(color: PhinexaColor.darkGrey),
          icon: Icon(Icons.arrow_drop_down, color: PhinexaColor.grey),
          isExpanded: true,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedCountry = newValue;
              });
              final selected =
                  _countries.firstWhere((c) => c['name'] == newValue);
              ref
                  .read(selectedLocationProvider.notifier)
                  .updateLocation(selected['latLng']);
            }
          },
          items: _countries
              .map<DropdownMenuItem<String>>((Map<String, dynamic> country) {
            return DropdownMenuItem<String>(
              value: country['name'],
              child: Text(
                country['name'],
                style: PhinexaFont.highlightRegular,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
