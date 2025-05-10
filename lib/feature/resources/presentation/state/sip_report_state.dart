import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gll/feature/resources/domain/model/sip_report/sip_report_model.dart';

part 'sip_report_state.freezed.dart';

@freezed
class SipReportState with _$SipReportState {
  factory SipReportState({
    @Default(false) bool isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    @Default({}) Map<String, dynamic>? form,
    @Default([]) List<SipReportModel> sipReportsData,
  }) = _SipReportState;
}
