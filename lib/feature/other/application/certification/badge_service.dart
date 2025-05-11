import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../../../core/presentation/provider/user_notifier_provider.dart';
import 'save_file_web.dart';

Future<void> createBadgePdf(WidgetRef ref, String badgeName) async {
  // Create a new PDF document
  final PdfDocument document = PdfDocument();
  document.pageSettings.orientation = PdfPageOrientation.portrait;
  document.pageSettings.margins.all = 0;
  final userState = ref.watch(userNotifierProvider);

  // Add a page to the PDF
  final PdfPage page = document.pages.add();

  // Get the page size
  final Size pageSize = page.getClientSize();

  // Load the background PNG image
  final PdfBitmap backgroundImage =
      PdfBitmap(await _readImageData('assets/badges/$badgeName'));

  // Calculate the aspect ratio of the image
  final double imageAspectRatio = backgroundImage.width / backgroundImage.height;
  
  // Calculate dimensions to maintain aspect ratio
  double imageWidth = pageSize.width;
  double imageHeight = imageWidth / imageAspectRatio;
  
  // If the height is too large, scale based on height instead
  if (imageHeight > pageSize.height) {
    imageHeight = pageSize.height;
    imageWidth = imageHeight * imageAspectRatio;
  }
  
  // Calculate centering position
  final double x = (pageSize.width - imageWidth) / 2;
  final double y = (pageSize.height - imageHeight) / 2;

  // Draw the background image on the page with correct aspect ratio
  page.graphics.drawImage(
    backgroundImage,
    Rect.fromLTWH(x, y, imageWidth, imageHeight),
  );

  // Save and launch the document
  final List<int> bytes = await document.save();
  document.dispose();

  // Save and launch the file
  await FileSaveHelper.saveAndLaunchFile(bytes, 'Badge.pdf');
}

Future<Uint8List> _readImageData(String path) async {
  final ByteData data = await rootBundle.load(path);
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
} 