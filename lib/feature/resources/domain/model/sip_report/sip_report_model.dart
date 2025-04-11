import 'package:freezed_annotation/freezed_annotation.dart';

part 'sip_report_model.freezed.dart';

@freezed
class SipReportModel with _$SipReportModel {
  const factory SipReportModel({
    required int id,
    required String title,
    required String description,
    required String image,
    String? link,
  }) = _SipReportModel;
}
