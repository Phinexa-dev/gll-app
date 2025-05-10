import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_sip_report_request.freezed.dart';
part 'upload_sip_report_request.g.dart';

@freezed
class UploadSipReportRequest with _$UploadSipReportRequest {
  const factory UploadSipReportRequest({
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "link") String? link,
  }) = _UploadSipReportRequest;

  factory UploadSipReportRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadSipReportRequestFromJson(json);
}
