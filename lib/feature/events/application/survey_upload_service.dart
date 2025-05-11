import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/local/user/model/user_model.dart';
import '../../../core/data/local/user/user_service.dart';
import '../../../core/data/remote/network_service.dart';

final databaseRef = FirebaseDatabase.instance.ref();

Future<void> uploadSurveyData(
    WidgetRef ref, Map<String, dynamic> responses, String survey) async {
  try {
    final dio = ref.watch(networkServiceProvider);
    final userService = ref.read(userServiceProvider(dio));
    UserModel? user = await userService.getUser();

    if (user == null || user.email.isEmpty) {
      print("No valid user found.");
      return;
    }

    // Sanitize email and survey name for Firebase keys
    String safeEmail = _sanitizeKey(user.email);
    String safeSurvey = _sanitizeKey(survey);

    // Upload survey responses
    await _uploadSurveyResponses(safeEmail, safeSurvey, responses);

    // Add survey name to the user's survey list if it doesn't already exist
    await _addSurveyNameToArray(safeEmail, safeSurvey);

    print("Survey data uploaded successfully!");
  } catch (error) {
    print("Failed to upload survey data: $error");
  }
}

/// Adds a survey name to the user's survey array if it doesn't already exist.
Future<void> _addSurveyNameToArray(String safeEmail, String safeSurvey) async {
  final surveysRef = databaseRef.child("Users/$safeEmail/surveys");

  // Retrieve the current survey array
  DatabaseEvent event = await surveysRef.once();
  DataSnapshot snapshot = event.snapshot;

  List<dynamic> surveyNames = [];
  if (snapshot.exists) {
    // Convert the fixed-length list to a modifiable list
    surveyNames = List.from(snapshot.value as List<dynamic>? ?? []);
  }

  // Check if the survey name already exists in the array
  if (!surveyNames.contains(safeSurvey)) {
    surveyNames.add(safeSurvey); // Add the new survey name
    await surveysRef.set(surveyNames); // Update the array in Firebase
  } else {
    print("Survey '$safeSurvey' already exists for user $safeEmail.");
  }
}

/// Retrieves and returns a list of survey names for a specific user.
Future<List<String>> retrieveSurveyNames(WidgetRef ref, String email) async {
  try {
    String safeEmail = _sanitizeKey(email);
    final surveysRef = databaseRef.child("Users/$safeEmail/surveys");

    DatabaseEvent event = await surveysRef.once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.exists) {
      // Convert the fixed-length list to a modifiable list
      List<dynamic> surveyNames =
          List.from(snapshot.value as List<dynamic>? ?? []);
      return surveyNames.map((name) => name.toString()).toList();
    }

    print("No surveys found for user $email.");
    return [];
  } catch (error) {
    print("Failed to retrieve survey names: $error");
    return [];
  }
}

/// Sanitizes keys for Firebase by replacing invalid characters.
String _sanitizeKey(String key) {
  const invalidCharacters = ['.', '@', '/', '#', '\$', '[', ']'];
  String sanitizedKey = key;
  for (var char in invalidCharacters) {
    sanitizedKey = sanitizedKey.replaceAll(char, '_');
  }
  return sanitizedKey;
}

/// Sanitizes Firebase keys in a nested map.
Map<String, dynamic> _sanitizeFirebaseKeys(Map<String, dynamic> map) {
  final sanitizedMap = <String, dynamic>{};

  for (var key in map.keys) {
    String sanitizedKey = _sanitizeKey(key);

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

/// Uploads survey responses to Firebase.
Future<void> _uploadSurveyResponses(
    String safeEmail, String safeSurvey, Map<String, dynamic> responses) async {
  await databaseRef
      .child("$safeSurvey/$safeEmail/response")
      .set(_sanitizeFirebaseKeys(responses));
}
