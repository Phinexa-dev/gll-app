import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../provider/location_provider.dart';

class SearchBarWidget extends ConsumerStatefulWidget {
  const SearchBarWidget({super.key});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _countries = [
    {'name': 'India', 'latLng': LatLng(20.5937, 78.9629)},
    {'name': 'United States', 'latLng': LatLng(37.0902, -95.7129)},
    {'name': 'Canada', 'latLng': LatLng(56.1304, -106.3468)},
    {'name': 'United Kingdom', 'latLng': LatLng(51.5074, -0.1278)},
    {'name': 'Australia', 'latLng': LatLng(-25.2744, 133.7751)},
  ];

  List<Map<String, dynamic>> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    _filteredCountries = [];
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = [];
      } else {
        _filteredCountries = _countries
            .where((country) =>
                country['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

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
      child: Column(
        children: [
          // Search bar
          Row(
            children: [
              Icon(
                Icons.search,
                color: PhinexaColor.grey,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  controller: _controller,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    hintText: "Search for countries or SIPs",
                    hintStyle: PhinexaFont.highlightRegular
                        .copyWith(color: PhinexaColor.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          if (_filteredCountries.isNotEmpty)
            SingleChildScrollView(
              child: Container(
                height: 200,
                child: ListView.builder(
                  itemCount: _filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = _filteredCountries[index];
                    return ListTile(
                      title: Text(country['name']),
                      onTap: () {
                        ref
                            .read(selectedLocationProvider.notifier)
                            .updateLocation(
                              country['latLng'],
                            );
                        FocusScope.of(context).unfocus();
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
