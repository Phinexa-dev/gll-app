import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/other/presentation/ui/widget/sip_detail_views/hawai.dart';
import 'package:gll/feature/other/presentation/ui/widget/sip_detail_views/kosovo.dart';
import 'package:gll/feature/other/presentation/ui/widget/sip_detail_views/sri_lanka.dart';

import '../widget/sip_detail_views/nepal.dart';
import '../widget/sip_detail_views/north_macedonia.dart';
import '../widget/sip_detail_views/usa.dart';

class CampDetailScreen extends ConsumerWidget {
  final String country;

  const CampDetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget childWidget;

    switch (country) {
      case 'North Macedonia':
        childWidget = NorthMacedonia();
        break;
      case 'Sri Lanka':
        childWidget = SriLanka();
        break;
      case 'Hawaii':
        childWidget = Hawaii();
        break;
      case 'Kosovo':
        childWidget = Kosovo();
        break;
      case 'Nepal':
        childWidget = Nepal();
        break;
      case 'United States':
        childWidget = USA();
        break;
      default:
        childWidget = Center(child: Text('No details found for $country'));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('$country SIP\'s', style: PhinexaFont.headingSmall),
      ),
      body: childWidget,
    );
  }
}

// A generic placeholder widget to show how other country screens would be implemented.
class PlaceholderScreen extends StatelessWidget {
  final String countryName;
  const PlaceholderScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the screen for $countryName',
        style: PhinexaFont.headingLarge,
      ),
    );
  }
}
