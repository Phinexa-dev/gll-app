import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/remote/network_service.dart';
import 'package:gll/feature/resources/data/dto/request/sip_report/upload_sip_report/upload_sip_report_request.dart';
import 'package:retrofit/retrofit.dart';

import '../../../dto/response/sip_report/sip_report_response.dart';
import '../../../dto/response/sip_report/upload_sip_report_response.dart';

part 'manage_sip_report_data_api.g.dart';

final manageSipReportDataApiProvider = Provider<ManageSipReportDataApi>((ref) {
  final Dio dio = ref.watch(networkServiceProvider);
  return ManageSipReportDataApi(dio);
});

@RestApi()
@Header('Content-Type : application/json')
abstract class ManageSipReportDataApi {
  factory ManageSipReportDataApi(Dio dio) => _ManageSipReportDataApi(dio);

  @GET('/sip')
  Future<List<SipReportResponse>> getSipReports();

  @POST('/sip')
  Future<UploadSipReportResponse> uploadSipReport(
      @Body() UploadSipReportRequest data);
}
