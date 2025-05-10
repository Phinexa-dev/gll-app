import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dto/response/certificate/certificate_response.dart';
import '../data/repository/certificate/certificate_repository.dart';
import '../data/repository/certificate/icertificate_repository.dart';
import '../domain/model/certificate/certificate_model.dart';
import 'icertificate_service.dart';

final certificateServiceProvider = Provider<ICertificateService>((ref) {
  final ICertificateRepository certificateRepository =
      ref.watch(certificateRepositoryProvider);
  return CertificateService(certificateRepository);
});

final class CertificateService implements ICertificateService {
  final ICertificateRepository _certificateRepository;

  CertificateService(this._certificateRepository);

  @override
  Future<List<CertificateModel>> getCertificates() async {
    try {
      final response = await _certificateRepository.getCertificates();
      return response.map((cert) => _mapToCertificateModel(cert)).toList();
    } catch (e) {
      rethrow;
    }
  }

  CertificateModel _mapToCertificateModel(CertificateResponse response) {
    return CertificateModel(
      id: response.id,
      name: response.name,
      organization: response.organization,
      description: response.description,
    );
  }
}
