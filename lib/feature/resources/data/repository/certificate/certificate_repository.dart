import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/response/certificate/certificate_response.dart';
import '../../source/remote/certificate/certificate_api.dart';
import 'icertificate_repository.dart';

final certificateRepositoryProvider = Provider<ICertificateRepository>((ref) {
  final CertificateApi certificateApi = ref.watch(certificateApiProvider);
  return CertificateRepository(certificateApi);
});

final class CertificateRepository implements ICertificateRepository {
  final CertificateApi _certificateApi;

  CertificateRepository(this._certificateApi);

  @override
  Future<List<CertificateResponse>> getCertificates() async {
    try {
      final response = await _certificateApi.getCertificates();
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
