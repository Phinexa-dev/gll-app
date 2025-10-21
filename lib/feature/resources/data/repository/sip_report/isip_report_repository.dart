import 'package:gll/feature/resources/data/dto/request/sip_report/upload_sip_report/upload_sip_report_request.dart';
import 'package:gll/feature/resources/data/dto/response/sip_report/sip_report_response.dart';
import 'package:gll/feature/resources/data/dto/response/sip_report/upload_sip_report_response.dart';

abstract interface class ISipReportRepository {
  Future<List<SipReportResponse>> getSipReports();

  Future<UploadSipReportResponse> uploadSipReport(UploadSipReportRequest data);
}
