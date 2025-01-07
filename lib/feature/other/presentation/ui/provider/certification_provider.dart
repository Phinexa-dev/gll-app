import 'package:flutter_riverpod/flutter_riverpod.dart';

final certificationProvider = Provider<List<Map<String, String>>>((ref) {
  return [
    {
      "program": "Strategic Leadership Program",
      "lab": "Global Learning Lab",
      "year": "2020 - 2022",
      "description": "Focused on developing decision-making, team management, and strategic thinking skills.",
    },
    {
      "program": "Global Networking for Innovators",
      "lab": "Global Learning Lab",
      "year": "Ongoing (expected completion: 2024)",
      "description": "Emphasizes international collaboration, innovative problem-solving, and community engagement.",
    },
    {
      "program": "Agile Project Management Professional",
      "lab": "Global Learning Lab",
      "year": "2021",
      "description": "Explores agile methodologies and their application in cross-functional teams.",
    }
  ];
});