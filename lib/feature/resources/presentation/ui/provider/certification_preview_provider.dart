import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/dto/certificate_preview_model.dart';

final certificationPreviewListProvider =
    Provider<List<CertificatePreviewModelificate>>((ref) {
  return [
    CertificatePreviewModelificate(
        title: "Grad_Cert_F", path: "Grad_Cert_F.png", isMinimal: true),
    CertificatePreviewModelificate(
        title: "Grad_Cert_G", path: "Grad_Cert_G.png", isMinimal: true),
    CertificatePreviewModelificate(
        title: "Grad_Cert_GT", path: "Grad_Cert_GT.png", isMinimal: true),
    CertificatePreviewModelificate(
        title: "Grad_Cert_MT", path: "Grad_Cert_MT.png", isMinimal: false),
    CertificatePreviewModelificate(
        title: "Grad_Cert_SMT", path: "Grad_Cert_SMT.png", isMinimal: false),
  ];
});
