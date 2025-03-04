import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/local/user/model/user_model.dart';
import '../../../core/data/local/user/user_service.dart';

final databaseRef = FirebaseDatabase.instance.ref();

Future<void> uploadSurveyData(
    WidgetRef ref, Map<String, dynamic> responses, String survey) async {
  try {
    final userService = ref.read(userServiceProvider);
    UserModel? user = await userService.getUser();

    if (user == null || user.email.isEmpty) {
      print("No valid user found.");
      return;
    }

    // Sanitize email for Firebase keys (Firebase keys can't contain `.` or `#`, etc.)
    String safeEmail = user.email.replaceAll('.', '_').replaceAll('@', '_');
    String safeSurvey = survey.replaceAll('.', '_').replaceAll('@', '_');

    Map<String, dynamic> _sanitizeFirebaseKeys(Map<String, dynamic> map) {
      const invalidCharacters = ['/', '.', '#', '\$', '[', ']'];
      final sanitizedMap = <String, dynamic>{};

      for (var key in map.keys) {
        // Sanitize the key
        String sanitizedKey = key;
        for (var char in invalidCharacters) {
          sanitizedKey = sanitizedKey.replaceAll(char, '_');
        }

        // Recursively sanitize nested maps
        if (map[key] is Map<String, dynamic>) {
          sanitizedMap[sanitizedKey] =
              _sanitizeFirebaseKeys(map[key] as Map<String, dynamic>);
        } else {
          sanitizedMap[sanitizedKey] = map[key];
        }
      }

      return sanitizedMap;
    }

    await databaseRef
        .child("$safeSurvey/$safeEmail/response")
        .set(_sanitizeFirebaseKeys(responses));

    print("Survey data uploaded successfully!");
  } catch (error) {
    print("Failed to upload survey data: $error");
  }
}
