import 'package:gll/feature/resources/data/dto/request/sip_report/upload_sip_report/upload_sip_report_request.dart';

import '../../domain/model/sip_report/sip_report_model.dart';

abstract interface class IsipReportService {
  Future<List<SipReportModel>> getSipReports();

  Future<bool> uploadSipReport(UploadSipReportRequest data);
}
