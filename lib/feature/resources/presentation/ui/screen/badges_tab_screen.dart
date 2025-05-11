import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/application/certification/badge_service.dart';
import 'package:gll/feature/resources/presentation/controller/certificate/certificate_controller.dart';
import 'package:gll/feature/resources/presentation/ui/provider/badge_preview_provider.dart';

class BadgesTabScreen extends ConsumerStatefulWidget {
  const BadgesTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BadgesTabScreenState();
}

class _BadgesTabScreenState extends ConsumerState<BadgesTabScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch certificates when the tab is loaded
    Future.microtask(() =>
        ref.read(certificateControllerProvider.notifier).fetchCertificates());
  }

  @override
  Widget build(BuildContext context) {
    final allBadges = ref.watch(badgePreviewListProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final certificatesAsync = ref.watch(certificateControllerProvider);

    return certificatesAsync.when(
      data: (fetchedCertificates) {
        // Filter badges based on fetched data
        final availableBadges = allBadges.where((previewBadge) {
          return fetchedCertificates.any((fetchedCert) => previewBadge.path
              .toLowerCase()
              .contains(fetchedCert.name.toLowerCase()));
        }).toList();

        if (availableBadges.isEmpty) {
          return const Center(
            child: Text('No badges available'),
          );
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              availableBadges.length,
              (index) {
                final badge = availableBadges[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 24.0),
                  child: GestureDetector(
                    onTap: () => createBadgePdf(ref, badge.path),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/badges/${badge.path}',
                        width: screenWidth * 0.9,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error loading badges: ${error.toString()}'),
      ),
    );
  }
}
