import 'package:flutter_riverpod/flutter_riverpod.dart';

final educationHistoryProvider = Provider<List<Map<String, String>>>((ref) {
  return [
    {
      "degree": "Master of Business Administration (MBA)",
      "institution": "University of Toronto",
      "year": "2017 -2020",
      "icon": "masters.svg"
    },
    {
      "degree": "Bachelor of Commerce (BCom)",
      "institution": "McGill University",
      "year": "2018 - 2020",
      "icon": "bachelor.svg"
    },
  ];
});