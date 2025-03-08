import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/feature/other/domain/model/sip/sip_detail.dart';
import 'package:intl/intl.dart';

import '../../../../../common/theme/fonts.dart';
import '../widget/key_object_card.dart';
import '../widget/sub_event_widget.dart';

class CampDetailScreen extends ConsumerWidget {
  final SipDetail sipDetail;

  CampDetailScreen({super.key, required this.sipDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '${sipDetail.country} SIP\'s',
          style: PhinexaFont.headingSmall,
        ),
      ),
      body: SingleChildScrollView(
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
                      sipDetail.imageUrl, // Replace with your actual asset path
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: formatDateRange(
                          sipDetail.startDate, sipDetail.endDate),
                      style: PhinexaFont.headingLargeSemiMedium,
                    ),
                  ),
                ],
              ),
            ),
            _buildKeyTakeAwaysSection(context, sipDetail),
            const SizedBox(height: 20),
            Text(
              "Completed SIP's",
              style: PhinexaFont.headingExLarge,
            ),
            const SizedBox(height: 20),
            _buildEventsSection(context, sipDetail),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget _buildKeyTakeAwaysSection(BuildContext context, SipDetail sipDetails) {
  return Stack(
    children: [
      Positioned(
        top: -50,
        bottom: -70,
        child: SvgPicture.asset(
          'assets/more/camp_detail_bg_1.svg',
          fit: BoxFit.fill,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Text(
              "Key Takeaways",
              style: PhinexaFont.featureAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 80),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Generate a list of KeyObjectCard widgets
                final keyObjects = sipDetails.keyTakeAways.map((feature) {
                  return KeyObjectCard(
                    iconPath: feature.icon,
                    amount: feature.amount,
                    featureDescription: feature.description,
                  );
                }).toList();

                return StaggeredGrid.count(
                  crossAxisCount: 2, // 2 columns
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: List.generate(keyObjects.length, (index) {
                    // Logic for tile sizes
                    if (index == keyObjects.length - 1) {
                      // Last item takes full width
                      return StaggeredGridTile.fit(
                        crossAxisCellCount: 2,
                        child: keyObjects[index],
                      );
                    } else {
                      // First two items take half width and same height
                      return StaggeredGridTile.fit(
                        crossAxisCellCount: 1,
                        child: SizedBox(
                          height:
                              constraints.maxWidth / 2, // Set a fixed height
                          child: keyObjects[index],
                        ),
                      );
                    }
                  }),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}

String formatDateRange(DateTime startDate, DateTime endDate) {
  final DateFormat formatter = DateFormat('MMM yyyy');
  return '${formatter.format(startDate)} - ${formatter.format(endDate)}';
}

Widget _buildEventsSection(BuildContext context, SipDetail sipDetails) {
  return Stack(
    children: [
      // Background shapes
      Positioned(
        top: 50,
        child: SvgPicture.asset(
          'assets/more/camp_detail_bg_2.svg',
        ),
      ),
      Positioned(
        top: 900,
        child: SvgPicture.asset(
          'assets/more/camp_bg_4.svg',
        ),
      ),
      Positioned(
        bottom: 100,
        child: SvgPicture.asset(
          'assets/more/camp_bg_5.svg',
        ),
      ),
      // Scrollable content
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            sipDetails.sips.length * 2 - 1,
            (index) {
              if (index.isEven) {
                return SubEventWidget(sip: sipDetails.sips[index ~/ 2]);
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(
                    thickness: 1,
                    height: 40,
                    color: PhinexaColor.lightGrey,
                  ),
                );
              }
            },
          ),
        ),
      ),
    ],
  );
}
