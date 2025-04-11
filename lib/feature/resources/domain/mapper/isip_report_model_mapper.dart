import 'package:gll/feature/resources/data/dto/response/sip_report/sip_report_response.dart';
import 'package:gll/feature/resources/domain/model/sip_report/sip_report_model.dart';

abstract interface class I {
  SipReportModel toDomain(SipReportResponse data);
}
