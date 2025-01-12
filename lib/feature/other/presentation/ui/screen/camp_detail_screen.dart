import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/feature/other/presentation/ui/widget/sub_event_widget.dart';

import '../../../../../common/theme/fonts.dart';
import '../widget/key_object_card.dart';
import '../widget/map_view_widget.dart';
import '../widget/testomonial_widget.dart';

class CampDetailScreen extends ConsumerWidget {
  final CampEvent event;

  CampDetailScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SIP Map',
          style: PhinexaFont.headingSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      event.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return SizedBox(
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: event.title,
                      style: PhinexaFont.headingExLarge,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Empowering the Youth',
                        style: PhinexaFont.headingRegularSmall,
                      ),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Focused on health and safety in North Macedonia',
                        style: PhinexaFont.highlightRegular,
                      ),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            _buildKeyObjectSection(context, event),
            _buildSubEventSection(context, event),
            _buildTestomonialSection(context, event),
          ],
        ),
      ),
    );
  }
}

Widget _buildKeyObjectSection(BuildContext context, CampEvent event) {
  final List<Map<String, dynamic>> keyObjectivesWithIcons =
      event.keyObjectives.asMap().entries.map((entry) {
    int index = entry.key;
    KeyObjective keyObjective = entry.value;

    // Assign icons based on the index
    String iconPath;
    switch (index) {
      case 0:
        iconPath = 'assets/home/Alert.svg';
        break;
      case 1:
        iconPath = 'assets/home/family.svg';
        break;
      case 2:
        iconPath = 'assets/home/Support.svg';
        break;
      default:
        iconPath = 'assets/home/Activities.svg';
    }

    return {
      'iconPath': iconPath,
      'title': keyObjective.title,
      'description': keyObjective.description,
    };
  }).toList();

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
              "Key Objectives",
              style: PhinexaFont.featureAccent,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 80),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final itemCount = event.keyObjectives.length;
                  return Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 3 / 3.8,
                      ),
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        final feature = keyObjectivesWithIcons[index];
                        return KeyObjectCard(
                          iconPath: feature['iconPath']!,
                          featureTitle: feature['title']!,
                          featureDescription: feature['description']!,
                        );
                      },
                    ),
                  );
                },
              )),
        ],
      ),
    ],
  );
}

Widget _buildSubEventSection(BuildContext context, CampEvent event) {
  return Transform.translate(
    offset: Offset(0, -50),
    child: Column(
      children: List.generate(
        event.subEvents.length,
        (index) => Stack(
          children: [
            if (index % 2 == 1)
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/more/camp_detail_bg_2.svg',
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 30),
              child: SubEventWidget(
                subEvent: event.subEvents[index],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildTestomonialSection(BuildContext context, CampEvent event) {
  return Stack(children: [
    Positioned.fill(
      child: SvgPicture.asset(
        'assets/more/camp_detail_bg_3.svg',
        fit: BoxFit.fill,
        alignment: Alignment.center,
      ),
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
          child: Text(
            "Testimonials",
            style: PhinexaFont.featureAccent,
          ),
        ),
        Column(
          children: List.generate(
            event.testimonials.length,
            (index) => TestomonialWidget(
              testimonial: event.testimonials[index],
            ),
          ),
        ),
      ],
    ),
  ]);
}
