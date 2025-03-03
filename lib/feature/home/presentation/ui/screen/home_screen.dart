import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/feature/other/presentation/ui/widget/map_view_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../common/theme/fonts.dart';
import '../../../../../common/widget/custom_button.dart';
import '../../../../../core/route/route_name.dart';
import '../../../../bottom_bar/presentation/ui/provider/nav_provider.dart';
import '../../../../events/data/event_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String getGreeting() {
      final hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Good Morning';
      } else if (hour < 17) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    String imageUrl =
        'https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fwww.gravatar.com%2Favatar%2F2c7d99fe281ecd3bcd65ab915bac6dd5%3Fs%3D250';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl,
                    ),
                    radius: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getGreeting(),
                          style: PhinexaFont.labelRegular
                              .copyWith(color: PhinexaColor.darkGrey)),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Bryan Cotly',
                          style: PhinexaFont.highlightEmphasis,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(
                'assets/home/search_icon.svg',
                height: 28,
                width: 28,
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Transform.translate(
            offset: Offset(0, -40),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                'assets/home/home_screen_bg.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -50),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                                  'Empowering Youth to Lead and Innovate Globally',
                              style: PhinexaFont.headingExLarge,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text:
                                  'Global Learning Lab (GL2) is a youth leadership development organization operating in 6 countries across 3 continents. By empowering young leaders, GL2 fosters sustainable community impact projects and builds resilience through collaboration and mentorship.',
                              style: PhinexaFont.highlightRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _buildEventSection(context, ref),
                _buildHowItWorksSection(context),
                _buildSipMapSection(context)
              ],
            ),
          ),
        ]),
      )),
    );
  }
}

Widget _buildEventSection(BuildContext context, WidgetRef ref) {
  final events = ref.watch(eventProvider);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Events",
              style: PhinexaFont.headingLarge,
            ),
            IconButton(
              icon: Icon(
                Icons.chevron_right_rounded,
                size: 30,
              ),
              onPressed: () {
                ref.read(navProvider.notifier).onItemTapped(2);
              },
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(RouteName.eventDetails, extra: events.first);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              events.first.image, // Change this to your asset path
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              events.first.title,
              style: PhinexaFont.featureEmphasis,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'Registration and Information',
              style: PhinexaFont.contentRegular,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              DateFormat('MMMM d, yyyy').format(events.first.startDate),
              style:
                  PhinexaFont.captionRegular.copyWith(color: PhinexaColor.grey),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: 12,
            ),
            CustomButton(
              label: "Register Now",
              height: 40,
              onPressed: () {
                context.pushNamed(RouteName.registrationForm, extra: true);
              },
            ),
          ],
        )
      ],
    ),
  );
}

Widget _buildHowItWorksSection(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(
      height: 24,
    ),
    Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(
            'assets/home/home_screen_bg_2.svg',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'How it works',
              style: PhinexaFont.headingLarge,
            ),
          ),
        )
      ],
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Text("Sustainable Impact Projects (SIPs)",
              style: PhinexaFont.featureEmphasis),
          SizedBox(
            height: 12,
          ),
          Text(
              "Sustainable Impact Projects (SIPs) are the cornerstone of the Leadership Academy. They empower youth leaders to design and implement community-based projects that address local challenges, create measurable outcomes, and foster sustainable development.",
              style: PhinexaFont.contentRegular),
        ],
      ),
    ),
    SizedBox(
      height: 24,
    ),
    Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(
            'assets/home/home_screen_bg_3.svg',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 45,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text("Leadership Academy (LA) vs. Train the Trainer (TTT)",
                      style: PhinexaFont.featureEmphasis),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                      " The Leadership Academy (LA) and Train-the-Trainer (TTT) programs are complementary components of GL2’s scalable youth leadership model. While LA focuses on empowering youth directly, TTT builds the capacity of trainers who can cascade the training to others.",
                      style: PhinexaFont.contentRegular),
                ],
              ),
            ),
          ),
        )
      ],
    ),
    SizedBox(
      height: 24,
    ),
    SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SvgPicture.asset(
        'assets/home/home_screen_bg_4.svg',
        fit: BoxFit.fill,
      ),
    ),
    SizedBox(
      height: 24,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Text("Path to Global Trainer", style: PhinexaFont.featureEmphasis),
          SizedBox(
            height: 12,
          ),
          Text(
              "The Path to Global Trainer is a structured journey that transforms a Leadership Academy participant into a certified trainer and eventually a global leadership ambassador.",
              style: PhinexaFont.contentRegular),
        ],
      ),
    ),
  ]);
}

Widget _buildSipMapSection(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
          ),
          Text("SIP’s MAKE A WAVE AROUND THE WORLD",
              style: PhinexaFont.headingLarge),
          SizedBox(
            height: 12,
          ),
          Text(
              "Explore the global impact of GL2 through our interactive map. Click on any location to discover Sustainable Impact Projects (SIPs).",
              style: PhinexaFont.contentRegular),
          SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: MapViewWidget(),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          CustomButton(
            label: "Explorer More",
            height: 40,
            onPressed: () {
              context.pushNamed(RouteName.worldMap);
            },
          ),
        ],
      ),
    ),
  ]);
}
