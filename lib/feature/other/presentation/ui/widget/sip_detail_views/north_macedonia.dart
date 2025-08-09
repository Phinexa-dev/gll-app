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

class NorthMacedonia extends ConsumerWidget {
  const NorthMacedonia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Define the SipDetail object here
    final sipDetail = SipDetail(
      imageUrl: 'assets/events/sip_image.png',
      numberOfPeopleImpacted: 2000,
      numberOfSips: 15,
      keyTakeAways: [
        KeyTakeAways(
          amount: 15,
          description: 'SIP’s completed impacting over 2,000 people',
        ),
      ],
      sips: [
        Sip(
          title: 'IRIZ',
          description:
              'Clothes donation for orphans and advocacy for changing policies. Para- legal assistance for illiterate people in Shuto Orizari.',
          quote: 'Warm Home for All',
        ),
        Sip(
          title: 'Romano Chachipe',
          description:
              'Volunteers conducted a field survey to identify families in need and provided formula and diapers to 30 families in an informal settlement.',
          quote: 'Improving lives of the underprivileged',
        ),
        Sip(
          title: 'MCIS',
          description:
              'New year party and a puppet show for children from the daily care center for children in social risk from Shuto Orizari.',
          quote: 'Spread the New Year Joy',
        ),
        Sip(
          title: 'Apple Tree',
          description:
              'The initiative aimed to provide a safe environment for the victims to express their suppressed feelings and heal the wounds by art and music.',
          quote: 'I\'m enough',
        ),
        Sip(
          title: 'SOS Children Village Skopje',
          description:
              'Providing Macedonian and Math lessons for children from underprivileged families, providing school supplies.',
          quote: 'Teaching the Vulnerable',
        ),
        Sip(
          title: 'The Light of Live',
          description:
              'High school students teach younger students basic IT skills for writing CVs and motivational letters. They also offer free art classes for talented children in grades 1–4.',
          quote: 'Peers for Peers',
        ),
        Sip(
          title: 'Habitat for Humanity Macedonia',
          description:
              'Establishment of school eco club in Shaip Jusuf high school, purchase of equipment and plants, and working on upgrading vocational skills for construction technicians.',
          quote: 'School Eco Club',
        ),
        Sip(
          title: 'REDI',
          description:
              'The volunteers were trained in previously created program for Young Roma Entrepreneurs, and held two trainings for Roma youth age 18-25 teaching them the basic skills of entrepreneurship.',
          quote: 'Young Roma Entrepreneurs Training for Skills development',
        ),
        Sip(
          title: 'GO GREEN',
          description:
              'Advocacy, campaign in the schools and final event where young rock bands were invited to perform in order to be promoted. The final event included family day with games, competitions in environmental games and promotion of the initiative.',
          quote: 'Fairer Action for Climate Change',
        ),
        Sip(
          title: 'SOS Children Village',
          description:
              '5-day educational event, where people from disadvantage families were educated on how to save money and how to spend smart.',
          quote:
              'Financial education for the families in social risk and disadvantage families from the informal settlements',
        ),
        Sip(
          title: 'GO GREEN',
          description:
              'This initiative aimed gathering in one place youth from different cultures. Three bands were invited to play music from their culture, and art corner was placed so the youth can express their cultural diversity.',
          quote: 'The Sounds of the Cultures',
        ),
        Sip(
          title: 'Stella Network',
          description:
              'Volunteers joined the “Share Your Miracle” movement, where women and girls shared achievements and learned from mentors. They later organized panel discussions in schools and cafés to inspire others. School clubs were formed, and peer-to-peer mentoring sessions now take place.',
          quote: 'Share Your Miracle',
        ),
        Sip(
          title: 'GO GREEN',
          description:
              'Volunteers mediated partnership between GG, REDI, and their high school to open a recycling center that serves students, teachers, and nearby residents. Funds from recycled materials will support school renovations.',
          quote: 'Recycling Center Partnership',
        ),
        Sip(
          title: 'KRIK',
          description:
              'Their artwork is sold to help maintain the center, which is in poor condition. Volunteers and beneficiaries started processing the recycled plastic and paper to create decorative art, using a machine to process materials for sale.',
          quote: 'Art and music therapy for people with disabilities',
        ),
        Sip(
          title: 'SOS Children Village Skopje',
          description:
              'Volunteers organized a 5-day event for underprivileged Roma families from informal settlements. They taught basic hygiene practices, considering the frequent lack of water and electricity.',
          quote: 'Hygiene? - Yes, please!',
        ),
      ],
      country: 'North Macedonia',
      startDate: DateTime(2023, 11, 1),
      endDate: DateTime(2024, 11, 1),
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
        // Background shapes
        Positioned(
          top: 50,
          child: SvgPicture.asset('assets/more/camp_detail_bg_2.svg'),
        ),
        Positioned(
          top: 900,
          child: SvgPicture.asset('assets/more/camp_bg_4.svg'),
        ),
        Positioned(
          bottom: 100,
          child: SvgPicture.asset('assets/more/camp_bg_5.svg'),
        ),
        // Scrollable content
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
