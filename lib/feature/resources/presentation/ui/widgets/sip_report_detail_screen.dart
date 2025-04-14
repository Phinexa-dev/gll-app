// In your report detail screen
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../domain/model/sip_report/sip_report_model.dart';

class SipReportDetailScreen extends StatelessWidget {
  final SipReportModel report;

  const SipReportDetailScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(report.title)),
      body: SfPdfViewer.network(report.image),
    );
  }
}
