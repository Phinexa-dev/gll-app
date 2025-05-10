import 'package:freezed_annotation/freezed_annotation.dart';

part 'sip_report_response.freezed.dart';
part 'sip_report_response.g.dart';

@freezed
class SipReportResponse with _$SipReportResponse {
  const factory SipReportResponse({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "approved") required int approved,
    @JsonKey(name: "uid") required int uid,
  }) = _SipReportResponse;

  factory SipReportResponse.fromJson(Map<String, dynamic> json) =>
      _$SipReportResponseFromJson(json);
}
