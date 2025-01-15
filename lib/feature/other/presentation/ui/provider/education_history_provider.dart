import 'package:flutter_riverpod/flutter_riverpod.dart';

final educationHistoryProvider = StateProvider<List<Map<String, String>>>((ref) {
  return [
    {
      "id": "1",
      "degree": "Master of Business Administration (MBA)",
      "institution": "University of Toronto",
      "startDate": "2017",
      "endDate": "2020",
      "icon": "masters.svg"
    },
    {
      "id": "2",
      "degree": "Bachelor of Commerce (BCom)",
      "institution": "McGill University",
      "startDate": "2018",
      "endDate": "2020",
      "icon": "bachelor.svg"
    },
  ];
});

final addButtonPressedProvider = StateProvider<bool>((ref) => false);

final editButtonPressedProvider = StateProvider<bool>((ref) => false);