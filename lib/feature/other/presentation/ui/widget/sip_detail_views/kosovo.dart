import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/feature/other/domain/model/sip/sip_detail.dart';
import 'package:intl/intl.dart';

import '../../../../../../common/theme/fonts.dart';

class Kosovo extends ConsumerWidget {
  const Kosovo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define the SipDetail object for Nepal, now showing it has launched.
    final sipDetail = SipDetail(
      imageUrl: 'assets/more/sip_image_kosova.png', // A placeholder image asset
      numberOfPeopleImpacted: 0,
      numberOfSips: 0,
      keyTakeAways: [], // No key takeaways yet
      sips: [], // No completed SIPs yet
      country: 'Nepal',
      // Using the provided launch date
      startDate: DateTime(2025, 1, 1),
      endDate: DateTime(2025, 1, 1),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    sipDetail.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 100),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    // Now displaying the actual launch date range
                    text: "Launched April 2025",
                    style: PhinexaFont.headingLargeSemiMedium,
                  ),
                ),
              ],
            ),
          ),

          _buildLaunchDetailsSection(context),
          SvgPicture.asset('assets/more/faq_bg.svg', fit: BoxFit.fill),
        ],
      ),
    );
  }

  // A custom section to display the project status and a message.
  Widget _buildLaunchDetailsSection(BuildContext context) {
    return Stack(
      children: [
        // Background SVG image
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/more/camp_detail_bg_1.svg',
            fit: BoxFit.fill,
          ),
        ),
        // Content with padding
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                "Project Launched!",
                style: PhinexaFont.headingMedium.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                "More details about the completed SIPs will be added soon. We are excited to share the impact of our work in Kosovo!",
                style: PhinexaFont.contentRegular.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method for date formatting
  String formatDateRange(DateTime startDate, DateTime endDate) {
    final DateFormat formatter = DateFormat('MMM yyyy');
    return '${formatter.format(startDate)} - ${formatter.format(endDate)}';
  }
}
