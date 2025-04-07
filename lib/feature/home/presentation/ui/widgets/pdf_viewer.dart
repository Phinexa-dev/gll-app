import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewerScreen extends StatefulWidget {
  final String pdfAssetPath;

  const PdfViewerScreen({Key? key, required this.pdfAssetPath})
      : super(key: key);

  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  String? pdfPath;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    // Copy the PDF from assets to a temporary directory
    final file = await _copyAssetToFile(widget.pdfAssetPath);
    setState(() {
      pdfPath = file.path;
    });
  }

  Future<File> _copyAssetToFile(String assetPath) async {
    // Get the temporary directory
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/${assetPath.split('/').last}');

    // Load the asset as a byte array
    final byteData = await rootBundle.load(assetPath);

    // Write the byte array to the file
    await file.writeAsBytes(byteData.buffer.asUint8List());

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: pdfPath != null
          ? PDFView(
              filePath: pdfPath,
              enableSwipe: true,
              autoSpacing: false,
              pageFling: true,
              onRender: (pages) {
                print("PDF rendered with $pages pages");
              },
              onError: (error) {
                print("Error loading PDF: $error");
              },
              onPageError: (page, error) {
                print("Error on page $page: $error");
              },
              onViewCreated: (PDFViewController controller) {
                print("PDF view created");
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
