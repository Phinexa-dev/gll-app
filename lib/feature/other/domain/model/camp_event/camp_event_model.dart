import 'package:latlong2/latlong.dart';

import '../testimonial/testimonial.dart';

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

  KeyObjective({required this.title, required this.description});
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

class CountrySipBasicDetails {
  final String id;
  final String countryName;
  final int impactedNumber;
  final int numberOfSips;
  final bool onlyLaunched;
  final LatLng latLng;

  CountrySipBasicDetails({
    required this.id,
    required this.countryName,
    required this.impactedNumber,
    required this.numberOfSips,
    required this.onlyLaunched,
    required this.latLng,
  });
}
