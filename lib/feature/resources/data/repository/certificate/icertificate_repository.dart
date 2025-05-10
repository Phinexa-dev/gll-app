import '../../dto/response/certificate/certificate_response.dart';

abstract class ICertificateRepository {
  Future<List<CertificateResponse>> getCertificates();
}
