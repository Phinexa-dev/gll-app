import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../core/route/route_name.dart';
import 'custom_button.dart';
import 'custom_event_icon_button.dart';
import 'feature_card_widget.dart';
import 'guest_avatar_widget.dart';

class EventViewScreenWidget extends ConsumerStatefulWidget {
  const EventViewScreenWidget({super.key});

  @override
  _EventViewScreenWidgetState createState() => _EventViewScreenWidgetState();
}

class _EventViewScreenWidgetState extends ConsumerState<EventViewScreenWidget> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://plus.unsplash.com/premium_photo-1719943510748-4b4354fbcf56?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PhinexaColor.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: PhinexaColor.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ClipRRect(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return SizedBox(
                  height: 200,
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
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Leadership Academy",
                  style: PhinexaFont.headingLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Feb 10, 2025, 9:00 AM - 5:00 PM",
                  style: PhinexaFont.contentRegular
                      .copyWith(color: PhinexaColor.darkGrey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  "Green Earth Conference Center, San Francisco, CA",
                  style: PhinexaFont.contentRegular
                      .copyWith(color: PhinexaColor.darkGrey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 24,
                ),
                CustomButton(
                  label: "Register Now",
                  height: 40,
                  onPressed: () {
                    context.pushNamed(RouteName.registrationForm);
                  },
                ),
              ],
            ),
          ),
          _buildGuestSpeakerSection(context),
          _buildAboutEventSection(context),
          _buildFeaturesSection(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomEventIconButton(
                  iconPath: "assets/home/calender_icon.svg",
                  label: "Add to Calendar",
                  onPressed: () => (),
                  height: 40,
                ),
                CustomEventIconButton(
                  iconPath: "assets/home/bell_icon.svg",
                  label: "Add to Calendar",
                  onPressed: () => (),
                  height: 40,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
        ],
      )),
    );
  }
}

Widget _buildGuestSpeakerSection(BuildContext context) {
  final List<Map<String, String>> guests = [
    {
      'imageUrl':
          "https://plus.unsplash.com/premium_photo-1682614309378-68ff39240020?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      'guestName': "Dr. Ayesha Ahmed",
    },
    {
      'imageUrl':
          "https://plus.unsplash.com/premium_photo-1682614309378-68ff39240020?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      'guestName': "Dr. Johnathan Doe",
    },
    {
      'imageUrl':
          "https://plus.unsplash.com/premium_photo-1682614309378-68ff39240020?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      'guestName': "Dr. Emilyan Clark",
    },
    {
      'imageUrl':
          "https://plus.unsplash.com/premium_photo-1682614309378-68ff39240020?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      'guestName': "Dr. Michael Smith",
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 24,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Guest Speakers",
              style: PhinexaFont.featureEmphasis,
            ),
            Text(
              "See All",
              style: PhinexaFont.highlightRegular
                  .copyWith(color: PhinexaColor.primaryColor),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: guests.map((guest) {
            return GuestAvatarWidget(
              imageUrl: guest['imageUrl']!,
              guestName: guest['guestName']!,
            );
          }).toList(),
        ),
      ),
    ],
  );
}

Widget _buildAboutEventSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "About the Event",
        style: PhinexaFont.headingLarge,
      ),
      SizedBox(
        height: 24,
      ),
      RichText(
        text: TextSpan(
          style: PhinexaFont.highlightRegular,
          children: [
            TextSpan(
              text:
                  'Join us for an inspiring session with leaders from Greenpeace, WWF, and other prominent environmental organizations.\n\n',
            ),
            TextSpan(
              text:
                  'Learn about their journeys, challenges, and the impactful work they are doing to combat climate change.\n\n',
            ),
            TextSpan(
              text:
                  'Get practical tips on how you can contribute and make a difference in your community.',
            ),
          ],
        ),
      ),
      SizedBox(
        height: 24,
      ),
    ]),
  );
}

Widget _buildFeaturesSection(BuildContext context) {
  final List<Map<String, String>> featureList = [
    {
      'iconPath': 'assets/home/leaf.svg',
      'featureTitle': 'Guest speakers environmental organizations',
      'featureDescription':
          'Focus on practical strategies for youth leadership in environmental advocacy.',
    },
    {
      'iconPath': 'assets/home/family.svg',
      'featureTitle': 'Youth Leadership in Environmental Issues',
      'featureDescription':
          'Inspire young leaders to engage with climate change initiatives.',
    },
    {
      'iconPath': 'assets/home/medical.svg',
      'featureTitle': 'Global Environmental Action',
      'featureDescription':
          'Join global efforts for environmental preservation and sustainable living.',
    },
    {
      'iconPath': 'assets/home/quiz.svg',
      'featureTitle': 'Innovative Solutions for Sustainability',
      'featureDescription':
          'Showcase innovative solutions for sustainability in everyday life.',
    },
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        // Constraining GridView height
        height: 500, // Adjust the height as needed
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: featureList.length,
          itemBuilder: (context, index) {
            final feature = featureList[index];
            return FeatureCardWidget(
              iconPath: feature['iconPath']!,
              featureTitle: feature['featureTitle']!,
              featureDescription: feature['featureDescription']!,
            );
          },
        ),
      ),
    ]),
  );
}
