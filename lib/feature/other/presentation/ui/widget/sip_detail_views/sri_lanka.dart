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

class SriLanka extends ConsumerWidget {
  const SriLanka({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sipDetail = SipDetail(
      imageUrl: 'assets/more/sip_image_sri_lank.png',
      numberOfPeopleImpacted: 400,
      numberOfSips: 7,
      keyTakeAways: [
        KeyTakeAways(
          amount: 10,
          description: 'SIP’s completed impacting over 400 people',
        ),
      ],
      sips: [
        Sip(
          title: 'IFS Glo Team',
          description:
              'A Leadership Academy was conducted in Sinhala medium for Grade 10 and 11 students at Weralugahamula School, a rural school in Rakwana, Ratnapura.',
          quote: 'Leadership for the Next Generation',
        ),
        Sip(
          title: 'Fortude GLO Team',
          description:
              'Delivered a career guidance workshop for students at Our Lady of Victories Convent, Moratuwa.',
          quote: 'Guiding Future Leaders',
        ),
        Sip(
          title: 'Fortude GLO Team',
          description:
              'Organized a laptop donation and conducted a workshop on IT and career opportunities for students of Nambapana and Handapangoda Central College in Horana.',
          quote: 'Empowering with Technology',
        ),
        Sip(
          title: 'Fortude GLO Team',
          description:
              'Held a leadership and motivation workshop at St. Mary’s College, Bogawanthalawa.',
          quote: 'Motivating the Youth',
        ),
        Sip(
          title: 'Sandeshi B',
          description:
              'Facilitated a professional skills workshop at iHUB Batitleicaloa focused on job placement and interview readiness.',
          quote: 'Ready for the Workforce',
        ),
        Sip(
          title: 'NSBM Circularity & Sustainability Community',
          description:
              'Hosted a "Digital Hustle" workshop introducing IT freelancing and cybersecurity to nearly 100 Advanced Level students, promoting SDG Goal 4.',
          quote: 'Digital Skills for All',
        ),
        Sip(
          title: 'UCSC Students',
          description:
              'Ran "The Daily Grind" program to support students with productivity, goal-setitleing, and self-improvement strategies aligned with SDG Goals 4, 8, and 17.',
          quote: 'Productivity and Goals',
        ),
      ],
      country: 'Sri Lanka',
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
                    text: "Launched September 2023",
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

  // The helper methods are kept consistent with your original NorthMacedonia widget
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
    return Stack(
      children: [
        Positioned(
          top: 50,
          child: SvgPicture.asset('assets/more/camp_detail_bg_2.svg'),
        ),
        Positioned(
          top: 900,
          child: SvgPicture.asset('assets/more/camp_bg_4.svg'),
        ),
        Positioned(
          bottom: 10,
          child: SvgPicture.asset('assets/more/camp_bg_5.svg'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(sipDetails.sips.length * 2 - 1, (index) {
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
          }),
        ),
      ],
    );
  }
}
