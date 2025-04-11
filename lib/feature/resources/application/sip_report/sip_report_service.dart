import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/resources/data/dto/request/sip_report/upload_sip_report/upload_sip_report_request.dart';
import 'package:gll/feature/resources/data/dto/response/sip_report/sip_report_response.dart';
import 'package:gll/feature/resources/data/repository/sip_report/isip_report_repository.dart';
import 'package:gll/feature/resources/data/repository/sip_report/sip_report_repository.dart';
import 'package:gll/feature/resources/domain/model/sip_report/sip_report_model.dart';

import 'isip_report_service.dart';

final sipReportServiceProvider = Provider<SipReportService>((ref) {
  final sipReportRepository = ref.watch(sipReportRepositoryProvider);
  return SipReportService(sipReportRepository);
});

final class SipReportService implements IsipReportService {
  final ISipReportRepository _sipReportRepository;

  SipReportService(this._sipReportRepository);

  @override
  Future<bool> uploadSipReport(UploadSipReportRequest data) async {
    try {
      final response = await _sipReportRepository.uploadSipReport(data);

      // final educationDataModel = _mapToEducationDataModel(response);
      return true;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<SipReportModel>> getSipReports() async {
    try {
      final response = await _sipReportRepository.getSipReports();

      final sipReportsData =
          response.map((e) => _mapToSipReportModel(e)).toList();
      return sipReportsData;
    } on DioException catch (_) {
      rethrow;
    }
  }

  SipReportModel _mapToSipReportModel(SipReportResponse sipReportDataResponse) {
    return SipReportModel(
        id: sipReportDataResponse.id,
        title: sipReportDataResponse.title,
        description: sipReportDataResponse.description,
        image: sipReportDataResponse.image,
        link: sipReportDataResponse.link);
  }
}
