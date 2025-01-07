import 'package:flutter_riverpod/flutter_riverpod.dart';

final socialInformationProvider = Provider<Map<String, String>>((ref) {
  return {
    'Personal Blog' : 'www.bryancotly.com',
    'Facebook' : '@bryan_cotly',
    'LinkedIn' : 'bryan Cotly',
    'Instagram' : '@Bryan',
    'X': '@bryan_cotly',
  };
});