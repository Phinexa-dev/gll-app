import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/dto/certificate_preview_model.dart';

final certificationPreviewListProvider =
    Provider<List<CertificatePreviewModelificate>>((ref) {
  return [
    CertificatePreviewModelificate(
        title: "Global Learning Lab Leadership Academy Train-The-Trainer",
        path: "Grad_Cert_F.png",
        isMinimal: true),
    CertificatePreviewModelificate(
        title: "Global Learning Lab Global",
        path: "Grad_Cert_G.png",
        isMinimal: true),
    CertificatePreviewModelificate(
        title: "Global Learning Lab Global Trainer",
        path: "Grad_Cert_GT.png",
        isMinimal: true),
    CertificatePreviewModelificate(
        title: "Global Learning Lab Master Trainer",
        path: "Grad_Cert_MT.png",
        isMinimal: false),
    CertificatePreviewModelificate(
        title: "Global Learning Lab Sustainable Master Trainer",
        path: "Grad_Cert_SMT.png",
        isMinimal: false),
  ];
});
