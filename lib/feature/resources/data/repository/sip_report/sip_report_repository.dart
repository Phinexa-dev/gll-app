import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/resources/data/dto/request/sip_report/upload_sip_report/upload_sip_report_request.dart';
import 'package:gll/feature/resources/data/dto/response/sip_report/sip_report_response.dart';

import '../../source/remote/sip_report/manage_sip_report_data_api.dart';
import 'isip_report_repository.dart';

final sipReportRepositoryProvider = Provider<ISipReportRepository>((ref) {
  final ManageSipReportDataApi manageSipReportDataApi =
      ref.watch(manageSipReportDataApiProvider);
  return SipReportRepository(manageSipReportDataApi);
});

final class SipReportRepository implements ISipReportRepository {
  final ManageSipReportDataApi _manageSipReportDataApi;

  SipReportRepository(this._manageSipReportDataApi);

  @override
  Future<List<SipReportResponse>> getSipReports() async {
    try {
      final response = await _manageSipReportDataApi.getSipReports();
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<SipReportResponse> uploadSipReport(UploadSipReportRequest data) async {
    try {
      final response = await _manageSipReportDataApi.uploadSipReport(data);
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
