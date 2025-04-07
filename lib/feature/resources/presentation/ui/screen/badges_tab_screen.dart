import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/resources/presentation/ui/provider/badge_preview_provider.dart';

class BadgesTabScreen extends ConsumerStatefulWidget {
  const BadgesTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BadgesTabScreenState();
}

class _BadgesTabScreenState extends ConsumerState<BadgesTabScreen> {
  @override
  Widget build(BuildContext context) {
    final badgesList = ref.watch(badgePreviewListProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          badgesList.length,
          (index) {
            final cert = badgesList[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/badges/${cert.path}',
                  width: screenWidth * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
