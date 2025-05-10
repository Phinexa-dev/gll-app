import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadPdf({
    required File file,
    required String userName,
    required String reportName,
  }) async {
    try {
      final ref = _storage.ref().child('sip_reports/$userName/$reportName.pdf');

      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }
}
