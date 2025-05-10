import '../domain/model/certificate/certificate_model.dart';

abstract class ICertificateService {
  Future<List<CertificateModel>> getCertificates();
}
