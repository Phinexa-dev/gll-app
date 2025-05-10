// file_picker_provider.dart
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedFileProvider = StateProvider<File?>((ref) => null);

final filePickerServiceProvider = Provider<FilePickerService>((ref) {
  return FilePickerService(ref);
});

class FilePickerService {
  final Ref ref;

  FilePickerService(this.ref);

  Future<void> pickPdfFile() async {
    try {
      // Initialize FilePicker
      await FilePicker.platform.clearTemporaryFiles();

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (result != null &&
          result.files.isNotEmpty &&
          result.files.first.path != null) {
        ref.read(selectedFileProvider.notifier).state =
            File(result.files.first.path!);
      }
    } catch (e) {
      throw Exception('File picker error: ${e.toString()}');
    }
  }

  void clearSelectedFile() {
    ref.read(selectedFileProvider.notifier).state = null;
  }
}
