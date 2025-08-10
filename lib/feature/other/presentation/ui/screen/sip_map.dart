import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/presentation/ui/widget/map_view_widget.dart';
import 'package:latlong2/latlong.dart';
import '../../../../../common/theme/fonts.dart';
import '../widget/country_dropdown_widget.dart';

class SipMap extends ConsumerStatefulWidget {
  const SipMap({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SipMapState();
}

class _SipMapState extends ConsumerState<SipMap> {
  final GlobalKey<MapViewWidgetState> _mapKey = GlobalKey<MapViewWidgetState>();

  void _handleDropdownSelection(LatLng latLng) {
    // Call the map widget's method directly
    _mapKey.currentState?.handleTap(latLng, source: 'dropdown');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SIP Map', style: PhinexaFont.headingSmall),
              const SizedBox(width: 50),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          MapViewWidget(key: _mapKey),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: CountryMapDropdownWidget(
              onCountrySelected: _handleDropdownSelection,
            ),
          ),
        ],
      ),
    );
  }
}
