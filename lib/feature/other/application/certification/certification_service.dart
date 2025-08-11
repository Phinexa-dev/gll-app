import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../../../core/presentation/provider/user_notifier_provider.dart';
import 'save_file_web.dart';

Future<void> createCertificate(
  WidgetRef ref,
  String country,
  String certificateName,
  bool minimal,
) async {
  // Create a new PDF document
  final PdfDocument document = PdfDocument();
  document.pageSettings.orientation = PdfPageOrientation.landscape;
  document.pageSettings.margins.all = 0;
  final userState = ref.watch(userNotifierProvider);

  // Add a page to the PDF
  final PdfPage page = document.pages.add();

  // Get the page size
  final Size pageSize = page.getClientSize();

  // Load the background PNG image
  final PdfBitmap backgroundImage = PdfBitmap(
    await _readImageData('assets/certificates/$certificateName'),
  );

  // Draw the background image on the page
  page.graphics.drawImage(
    backgroundImage,
    Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
  );

  // Create fonts
  final PdfFont nameFont = PdfStandardFont(PdfFontFamily.helvetica, 14);
  final PdfFont dateFont = PdfStandardFont(PdfFontFamily.helvetica, 10);

  // Draw "Name" text
  double x = _calculateXPosition(
    userState.user?.fullName ?? 'Guest',
    nameFont,
    pageSize.width,
  );
  page.graphics.drawString(
    userState.user?.fullName ?? 'Guest',
    nameFont,
    bounds: Rect.fromLTWH(x, 229, 0, 0),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
  );

  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  x = _calculateXPosition(formattedDate, dateFont, pageSize.width);
  page.graphics.drawString(
    formattedDate,
    dateFont,
    bounds: Rect.fromLTWH(
      x - 140 - (minimal ? 15 : 0),
      354 - (minimal ? 23 : 0),
      0,
      0,
    ),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
  );

  final String locationText = country;
  x = _calculateXPosition(locationText, dateFont, pageSize.width);
  page.graphics.drawString(
    locationText,
    dateFont,
    bounds: Rect.fromLTWH(
      x + 145 + (minimal ? 10 : 0),
      354 - (minimal ? 23 : 0),
      0,
      0,
    ),
    brush: PdfSolidBrush(PdfColor(0, 0, 0)),
  );

  // Load the first signature PNG image
  final PdfBitmap primarySignatureImage = PdfBitmap(
    await _readImageData('assets/signatures/rick_hathaway_signature.png'),
  );

  // Draw the signature image on the certificate
  page.graphics.drawImage(
    primarySignatureImage,
    Rect.fromLTWH(220, pageSize.height - 220 - (minimal ? 5 : 0), 100, 40),
  );

  // Load the second signature PNG image
  final PdfBitmap secondarySignatureImage = PdfBitmap(
    await _readImageData(getSignaturePath(country)),
  );

  // Draw the signature image on the certificate
  page.graphics.drawImage(
    secondarySignatureImage,
    Rect.fromLTWH(pageSize.width - 330, pageSize.height - 215, 110, 40),
  );

  // Save and launch the document
  final List<int> bytes = await document.save();
  document.dispose();

  // Save and launch the file
  await FileSaveHelper.saveAndLaunchFile(bytes, 'Certificate.pdf');
}

double _calculateXPosition(String text, PdfFont font, double pageWidth) {
  final Size textSize = font.measureString(
    text,
    layoutArea: Size(pageWidth, 0),
  );
  return (pageWidth - textSize.width) / 2;
}

Future<Uint8List> _readImageData(String path) async {
  final ByteData data = await rootBundle.load(path);
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

String getSignaturePath(String country) {
  if (country == "India") {
    return 'assets/signatures/apoorv_poojary_signature.png';
  } else if (country == "North Macedonia" || country == "Balkans") {
    return 'assets/signatures/milena_musovska_signature.png';
  } else if (country == "Nepal") {
    return 'assets/signatures/sushma_b_shrestha_signature.png';
  } else {
    return 'assets/signatures/robin_signature.png';
  }
}
