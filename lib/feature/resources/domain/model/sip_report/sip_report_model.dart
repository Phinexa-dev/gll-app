import 'package:freezed_annotation/freezed_annotation.dart';

part 'sip_report_model.freezed.dart';
part 'sip_report_model.g.dart';

@freezed
class SipReportUser with _$SipReportUser {
  const factory SipReportUser({
    required int id,
    required String fullName,
    required String email,
  }) = _SipReportUser;

  factory SipReportUser.fromJson(Map<String, dynamic> json) =>
      _$SipReportUserFromJson(json);
}

@freezed
class SipReportModel with _$SipReportModel {
  const factory SipReportModel({
    required int id,
    required String title,
    required String description,
    required String image,
    String? link,
    required int approved,
    required int uid,
    required SipReportUser user,
  }) = _SipReportModel;

  factory SipReportModel.fromJson(Map<String, dynamic> json) =>
      _$SipReportModelFromJson(json);
}
