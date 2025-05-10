import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/certificate_service.dart';
import '../../../application/icertificate_service.dart';
import '../../../domain/model/certificate/certificate_model.dart';

final certificateControllerProvider = StateNotifierProvider<
    CertificateController, AsyncValue<List<CertificateModel>>>(
  (ref) {
    final certificateService = ref.watch(certificateServiceProvider);
    return CertificateController(certificateService);
  },
);

class CertificateController
    extends StateNotifier<AsyncValue<List<CertificateModel>>> {
  final ICertificateService _certificateService;

  CertificateController(this._certificateService)
      : super(const AsyncValue.loading());

  Future<void> fetchCertificates() async {
    try {
      state = const AsyncValue.loading();
      final certificates = await _certificateService.getCertificates();
      state = AsyncValue.data(certificates);
      print(
          'Fetched certificates: ${certificates.length}'); // Console log as requested
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      print('Error fetching certificates: $e'); // Console log error
    }
  }
}
