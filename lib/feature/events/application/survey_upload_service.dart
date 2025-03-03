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

    await databaseRef.child("$safeSurvey/$safeEmail/response").set(responses);

    print("Survey data uploaded successfully!");
  } catch (error) {
    print("Failed to upload survey data: $error");
  }
}
