import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/local/user/user_service.dart';
import 'package:gll/feature/other/application/certification/certification_service.dart';

import '../provider/certification_preview_provider.dart';

class CertificationTabScreen extends ConsumerStatefulWidget {
  const CertificationTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CertificationTabScreenState();
}

class _CertificationTabScreenState
    extends ConsumerState<CertificationTabScreen> {
  @override
  Widget build(BuildContext context) {
    final certificateList = ref.watch(certificationPreviewListProvider);
    final userAsync = ref.watch(userProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return userAsync.when(
      data: (user) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            certificateList.length,
            (index) {
              final cert = certificateList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: GestureDetector(
                  onTap: () => createCertificate(
                      ref, user!.country, cert.path, cert.isMinimal),
                  child: Card(
                    elevation: 2,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/certificates/${cert.path}',
                        width: screenWidth * 0.9,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text('Error loading user data: $error'),
      ),
    );
  }
}
