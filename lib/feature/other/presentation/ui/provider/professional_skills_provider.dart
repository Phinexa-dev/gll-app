import 'package:flutter_riverpod/flutter_riverpod.dart';

final professionalSkillsProvider = Provider<Map<String, String>>((ref) {
  return {
    'Strategic Leadership': '',
    'Agile Project Management': '',
    'Stakeholder Communication': '',
    'Data-Driven Decision Making': '',
    'Change Management': '',
  };
});