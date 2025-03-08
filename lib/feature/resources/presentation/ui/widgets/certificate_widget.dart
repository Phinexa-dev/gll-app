import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/save_file_web.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../screen/certification_tab_screen.dart';

class CertificateWidget extends ConsumerWidget {
  final Certificate certificate;

  const CertificateWidget({super.key, required this.certificate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        margin: EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: PhinexaColor.certficateBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        certificate.title,
                        style: PhinexaFont.highlightEmphasis,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8),
                      Text(
                        certificate.organization,
                        style: PhinexaFont.highlightRegular,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        certificate.duration,
                        style: PhinexaFont.highlightRegular,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 54,
                  height: 54,
                  child: Image.asset(
                    'assets/resources/certificate_icon.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              certificate.description,
              style: PhinexaFont.contentEmphasis,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCompletedChip(context),
                _buildShareButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCompletedChip(BuildContext context) {
  return Chip(
    avatar: Icon(Icons.check, color: PhinexaColor.darkGrey),
    label: Text('Completed',
        style:
            PhinexaFont.captionEmphasis.copyWith(color: PhinexaColor.darkGrey)),
    backgroundColor: PhinexaColor.lightGreen,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: PhinexaColor.darkGreen,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(50),
    ),
  );
}

Widget _buildShareButton(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      createCertificate();
    },
    icon: Text('Share',
        style: PhinexaFont.contentAccent.copyWith(color: PhinexaColor.white)),
    label: Icon(
      Icons.share_outlined,
      color: PhinexaColor.white,
    ),
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: PhinexaColor.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}

Future<void> createCertificate() async {
  // Create a new PDF document
  final PdfDocument document = PdfDocument();
  document.pageSettings.orientation = PdfPageOrientation.landscape;
  document.pageSettings.margins.all = 0;

  // Add a page to the PDF
  final PdfPage page = document.pages.add();

  // Get the page size
  final Size pageSize = page.getClientSize();

  // Load the background PNG image
  final PdfBitmap backgroundImage =
      PdfBitmap(await _readImageData('ttt_certificate.png'));

  // Draw the background image on the page
  page.graphics.drawImage(
    backgroundImage,
    Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
  );

  // Create fonts
  final PdfFont nameFont = PdfStandardFont(PdfFontFamily.helvetica, 22);
  final PdfFont courseFont = PdfStandardFont(PdfFontFamily.helvetica, 19);
  final PdfFont dateFont = PdfStandardFont(PdfFontFamily.helvetica, 16);

  // Draw "Name" text
  double x = _calculateXPosition("Name", nameFont, pageSize.width);
  page.graphics.drawString(
    "Name",
    nameFont,
    bounds: Rect.fromLTWH(x, 253, 0, 0),
    brush: PdfSolidBrush(PdfColor(20, 58, 86)),
  );

  // Draw "CourseName" text
  x = _calculateXPosition("CourseName", courseFont, pageSize.width);
  page.graphics.drawString(
    "CourseName",
    courseFont,
    bounds: Rect.fromLTWH(x, 340, 0, 0),
    brush: PdfSolidBrush(PdfColor(20, 58, 86)),
  );

  // Draw date text
  final String dateText = 'on ' + "CourseName";
  x = _calculateXPosition(dateText, dateFont, pageSize.width);
  page.graphics.drawString(
    dateText,
    dateFont,
    bounds: Rect.fromLTWH(x, 385, 0, 0),
    brush: PdfSolidBrush(PdfColor(20, 58, 86)),
  );

  // Load the signature PNG image
  final PdfBitmap signatureImage =
      PdfBitmap(await _readImageData('robin_signature.png'));

  // Draw the signature image on the certificate
  page.graphics.drawImage(
    signatureImage,
    Rect.fromLTWH(pageSize.width - 350, pageSize.height - 220, 110, 40),
  );

  // Save and launch the document
  final List<int> bytes = await document.save();
  document.dispose();

  // Save and launch the file
  await FileSaveHelper.saveAndLaunchFile(bytes, 'Certificate.pdf');
}

double _calculateXPosition(String text, PdfFont font, double pageWidth) {
  final Size textSize =
      font.measureString(text, layoutArea: Size(pageWidth, 0));
  return (pageWidth - textSize.width) / 2;
}

Future<Uint8List> _readImageData(String name) async {
  final ByteData data = await rootBundle.load('assets/resources/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

// Future<void> createCertificate() async {
//   //Create a PDF document.
//   final PdfDocument document = PdfDocument();
//   document.pageSettings.orientation = PdfPageOrientation.landscape;
//   document.pageSettings.margins.all = 0;
//   //Add page to the PDF
//   final PdfPage page = document.pages.add();
//   //Get the page size
//   final Size pageSize = page.getClientSize();
//   //Draw image
//   page.graphics.drawImage(PdfBitmap(await _readImageData('certificate.jpg')),
//       Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
//   //Create font
//   final PdfFont nameFont = PdfStandardFont(PdfFontFamily.helvetica, 22);
//   final PdfFont controlFont = PdfStandardFont(PdfFontFamily.helvetica, 19);
//   final PdfFont dateFont = PdfStandardFont(PdfFontFamily.helvetica, 16);
//   double x = _calculateXPosition("Name", nameFont, pageSize.width);
//   page.graphics.drawString("Name", nameFont,
//       bounds: Rect.fromLTWH(x, 253, 0, 0),
//       brush: PdfSolidBrush(PdfColor(20, 58, 86)));
//   x = _calculateXPosition("CourseNAme", controlFont, pageSize.width);
//   page.graphics.drawString("CourseNAme", controlFont,
//       bounds: Rect.fromLTWH(x, 340, 0, 0),
//       brush: PdfSolidBrush(PdfColor(20, 58, 86)));
//   final String dateText = 'on ' + "CourseNAme";
//   x = _calculateXPosition(dateText, dateFont, pageSize.width);
//   page.graphics.drawString(dateText, dateFont,
//       bounds: Rect.fromLTWH(x, 385, 0, 0),
//       brush: PdfSolidBrush(PdfColor(20, 58, 86)));
//   //Save and launch the document
//   final List<int> bytes = await document.save();
//   //Dispose the document.
//   document.dispose();
//   //Save and launch file.
//   await FileSaveHelper.saveAndLaunchFile(bytes, 'Certificate.pdf');
// }
//
// double _calculateXPosition(String text, PdfFont font, double pageWidth) {
//   final Size textSize =
//       font.measureString(text, layoutArea: Size(pageWidth, 0));
//   return (pageWidth - textSize.width) / 2;
// }
//
// Future<List<int>> _readImageData(String name) async {
//   final ByteData data = await rootBundle.load('assets/resources/$name');
//   return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
// }
