import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class FileSaveHelper {
  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    try {
      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      // Write the file to storage
      await file.writeAsBytes(bytes);

      // Open the file using default viewer
      await OpenFile.open(filePath);
    } catch (e) {
      print("Error saving file: $e");
    }
  }
}
