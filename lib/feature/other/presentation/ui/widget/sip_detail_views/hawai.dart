import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/feature/other/domain/model/sip/sip_detail.dart';
import 'package:intl/intl.dart';

import '../../../../../../common/theme/fonts.dart';
import '../key_object_card.dart';
import '../sub_event_widget.dart';

class Hawaii extends ConsumerWidget {
  const Hawaii({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define the SipDetail object for Hawaii with the provided data.
    final sipDetail = SipDetail(
      imageUrl: 'assets/more/sip_image_hawaii.png',
      numberOfPeopleImpacted: 100,
      numberOfSips: 1,
      keyTakeAways: [
        KeyTakeAways(
          amount: 1,
          description: 'SIP’s completed impacting over 100 people',
        ),
      ],
      sips: [
        Sip(
          title: 'Kaʻū Global Learning Lab (KGLL)',
          description:
              'Kaʻū High & Pāhala Elementary School launched Ka\'ū Global Learning Lab to build a resilient, thriving Kaʻū by making learning the heart of community development. Through partnerships with local and global leaders, KGLL connects students, educators, and the wider community to opportunities that drive youth leadership, sustainable enterprise, and lifelong learning.',
          quote: 'Building a Resilient Kaʻū',
        ),
      ],
      country: 'Hawaii',
      startDate: DateTime(2023, 11, 1), // Using a placeholder date
      endDate: DateTime(2024, 11, 1), // Using a placeholder date
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
                const SizedBox(height: 12),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Launched September 2024",
                    style: PhinexaFont.headingLargeSemiMedium,
                  ),
                ),
              ],
            ),
          ),
          _buildKeyTakeAwaysSection(context, sipDetail),
          const SizedBox(height: 20),
          Text("Completed SIP's", style: PhinexaFont.headingExLarge),
          const SizedBox(height: 20),
          _buildEventsSection(context, sipDetail),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // The helper methods are kept consistent with your original widgets.
  Widget _buildKeyTakeAwaysSection(BuildContext context, SipDetail sipDetails) {
    return Stack(
      children: [
        Positioned(
          top: -20,
          bottom: 0,
          child: SvgPicture.asset(
            'assets/more/sip_key_bg.svg',
            fit: BoxFit.fill,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Text("Key Takeaways", style: PhinexaFont.featureAccent),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 80),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final keyObjects = sipDetails.keyTakeAways.map((feature) {
                    return KeyObjectCard(
                      amount: feature.amount,
                      featureDescription: feature.description,
                    );
                  }).toList();

                  return StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: List.generate(keyObjects.length, (index) {
                      if (index == keyObjects.length - 1) {
                        return StaggeredGridTile.fit(
                          crossAxisCellCount: 2,
                          child: keyObjects[index],
                        );
                      } else {
                        return StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          child: SizedBox(
                            height: constraints.maxWidth / 2,
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
    // Custom layout for displaying SIP details
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sipDetails.sips.map((sip) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sip.title,
                style: PhinexaFont.hawaiianFont.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: PhinexaColor.textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                sip.description,
                style: PhinexaFont.hawaiianFont.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: PhinexaColor.textColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '"${sip.quote}"',
                style: PhinexaFont.hawaiianFont.copyWith(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: PhinexaColor.darkGrey,
                ),
              ),
              if (sipDetails.sips.last != sip)
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Divider(thickness: 1, color: PhinexaColor.lightGrey),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
