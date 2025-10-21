import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_sip_report_response.freezed.dart';
part 'upload_sip_report_response.g.dart';

@freezed
class UploadSipReportResponse with _$UploadSipReportResponse {
  const factory UploadSipReportResponse({
    String? message,
    bool? success,
  }) = _UploadSipReportResponse;

  factory UploadSipReportResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadSipReportResponseFromJson(json);
}

