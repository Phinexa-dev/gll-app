import 'package:freezed_annotation/freezed_annotation.dart';

part 'sip_report_response.freezed.dart';
part 'sip_report_response.g.dart';

@freezed
class SipReportUserResponse with _$SipReportUserResponse {
  const factory SipReportUserResponse({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "fullName") required String fullName,
    @JsonKey(name: "email") required String email,
  }) = _SipReportUserResponse;

  factory SipReportUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SipReportUserResponseFromJson(json);
}

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
    @JsonKey(name: "user") required SipReportUserResponse user,
  }) = _SipReportResponse;

  factory SipReportResponse.fromJson(Map<String, dynamic> json) =>
      _$SipReportResponseFromJson(json);
}
