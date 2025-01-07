import 'package:flutter_riverpod/flutter_riverpod.dart';

final personalDetailProvider = Provider<Map<String, String>>((ref) {
  return {
    'Contact Number': '+1 (416) 555-1234',
    'Location': 'Toronto, Canada',
    'Languages': 'English, French',
    'Interests': 'Leadership Development',
  };
});