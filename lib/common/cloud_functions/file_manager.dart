import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;

class FileManager {
  Future<String> uploadFile(File file, String location, String fileName) async {
    // await FirebaseAuth.instance.signInAnonymously();
    // Define the path and file name to upload
    Reference ref = _storage.ref().child('$location$fileName');

    final uploadTask = ref.putFile(file);
    final isConnected = await hasNetworkConnection();
    if (!isConnected) {
      uploadTask.cancel();
      throw PlatformException(
          code: 'network_error', message: 'Network connectivity lost');
    }

    // Upload
    await uploadTask;

    String downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }

  Future<List<String>> getFileNames(List<String> fileUrls) async {
    List<String> fileNames = await Future.wait(
      fileUrls.map((url) async {
        return (await getFileMetaData(url)).name;
      }).toList(),
    );

    return fileNames;
  }

  Future<FullMetadata> getFileMetaData(String fileUrl) async {
    final httpsReference = _storage.refFromURL(fileUrl);

    // Get metadata properties
    final metadata = await httpsReference.getMetadata();
    print("Meta data: ${metadata.name}");

    return metadata;
  }

  Future<bool> hasNetworkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
}