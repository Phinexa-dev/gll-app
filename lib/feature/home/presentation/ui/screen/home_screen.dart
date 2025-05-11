import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../common/theme/fonts.dart';
import '../../../../../common/widget/custom_button.dart';
import '../../../../../core/data/local/user/user_service.dart';
import '../../../../../core/presentation/provider/user_notifier_provider.dart';
import '../../../../../core/route/route_name.dart';
import '../../../../bottom_bar/presentation/ui/provider/nav_provider.dart';
import '../../../../events/application/survey_upload_service.dart';
import '../../../../events/data/event.dart';
import '../../../../events/data/event_provider.dart';
import '../../../../other/presentation/controller/profile/profile_controller.dart';
import '../../../../other/presentation/ui/widget/map_view_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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

  @override
  void initState() {
    super.initState();

    // fetch data needed
    Future.microtask(() {
      ref.read(profileControllerProvider.notifier).updateFormData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(profileControllerProvider).isLoading;
    final userData = ref.read(profileControllerProvider).form;

    print("User Data dp: ${userData?['profileImage']}");

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
                  child: isLoading?
                  Shimmer(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.white,
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey,
                    ),
                  )
                  :
                  userData?['profileImage'] != null?
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(userData?['profileImage']),
                      )
                        :
                      CircleAvatar(
                        radius: 24,
                        child: Icon(Icons.person),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ref.watch(userProvider).when(
                        data: (user) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getGreeting(),
                              style: PhinexaFont.labelRegular
                                  .copyWith(color: PhinexaColor.darkGrey),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                user?.fullName ?? 'Guest',
                                style: PhinexaFont.highlightEmphasis,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        loading: () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getGreeting(),
                              style: PhinexaFont.labelRegular
                                  .copyWith(color: PhinexaColor.darkGrey),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Loading...',
                                style: PhinexaFont.highlightEmphasis,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        error: (error, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getGreeting(),
                              style: PhinexaFont.labelRegular
                                  .copyWith(color: PhinexaColor.darkGrey),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Error loading name',
                                style: PhinexaFont.highlightEmphasis,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
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
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    _buildWelcomeSection(),
                    _buildEventSection(ref),
                    _buildHowItWorksSection(),
                    _buildSipMapSection(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Empowering Youth to Lead and Innovate Globally',
              style: PhinexaFont.headingExLarge,
            ),
          ),
          SizedBox(height: 24),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text:
                  'Global Learning Lab (GL2) works to empower youth across the world with the leadership skills they need to make the difference they want to see in their communities.',
              style: PhinexaFont.highlightRegular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventSection(WidgetRef ref) {
    final events = ref.watch(eventProvider);
    final userState = ref.watch(userNotifierProvider);

    if (events.isEmpty) {
      return Center(child: Text("No events available."));
    }

    final event = events.first;
    final userEmail = userState.user?.email;

    return FutureBuilder<List<String>>(
      future: userEmail != null
          ? _getUserSurveyNames(ref, userEmail)
          : Future.value([]),
      builder: (context, snapshot) {
        final hasRegistered = snapshot.data?.contains(
              'Pre_Survey_${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}',
            ) ??
            false;

        return _buildEventSectionContent(context, ref, event, hasRegistered);
      },
    );
  }

  Widget _buildEventSectionContent(
      BuildContext context, WidgetRef ref, Event event, bool hasRegistered) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Events", style: PhinexaFont.headingLarge),
              TextButton(
                  onPressed: () {
                    ref.read(navProvider.notifier).onItemTapped(2);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "See All Events",
                        style: PhinexaFont.labelRegular
                            .copyWith(color: PhinexaColor.primaryColor),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 22,
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              context.pushNamed(RouteName.eventDetails, extra: event);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                event.image,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image, size: 100),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(event.title,
                  style: PhinexaFont.featureEmphasis,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Text('Registration and Information',
                  style: PhinexaFont.contentRegular),
              SizedBox(height: 5),
              Text(
                DateFormat('MMMM d, yyyy').format(event.startDate),
                style: PhinexaFont.captionRegular
                    .copyWith(color: PhinexaColor.grey),
              ),
              if (!hasRegistered)
                Column(
                  children: [
                    SizedBox(height: 12),
                    CustomButton(
                      label: "Register Now",
                      height: 40,
                      onPressed: () {
                        context.pushNamed(RouteName.registrationForm, extra: {
                          'isTTT': event.isTTT,
                          'eventIdentity':
                              '${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}',
                        });
                      },
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/home/home_screen_bg_2.svg',
                  fit: BoxFit.fill),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text('How it works', style: PhinexaFont.headingLarge),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text("Leadership Academy (LA) vs. Train the Trainer (TTT)",
                  style: PhinexaFont.featureEmphasis),
              SizedBox(height: 12),
              Text(
                "The Leadership Academy (LA) and Train-the-Trainer (TTT) programs are complementary components of GL2’s scalable youth leadership model. While LA focuses on empowering youth directly, TTT builds the capacity of trainers who can cascade the training to others.",
                style: PhinexaFont.contentRegular,
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/home/home_screen_bg_3.svg',
                  fit: BoxFit.fill),
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
                      SizedBox(height: 12),
                      Text("Sustainable Impact Projects (SIPs)",
                          style: PhinexaFont.featureEmphasis),
                      SizedBox(height: 12),
                      Text(
                        "Sustainable Impact Projects (SIPs) are the cornerstone of the Leadership Academy. They empower youth leaders to design and implement community-based projects that address local challenges, create measurable outcomes, and foster sustainable development.",
                        style: PhinexaFont.contentRegular,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset('assets/home/home_screen_bg_4.svg',
              fit: BoxFit.fill),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text("Path to Global Trainer",
                  style: PhinexaFont.featureEmphasis),
              SizedBox(height: 12),
              Text(
                "The Path to Global Trainer is a structured journey that transforms a Leadership Academy participant into a certified trainer and eventually a global leadership ambassador.",
                style: PhinexaFont.contentRegular,
              ),
              SizedBox(height: 15),
              CustomButton(
                label: "Cascading Model",
                height: 40,
                onPressed: () {
                  context.pushNamed(RouteName.pdfViewer,
                      extra: "assets/pdf/casacading_model.pdf");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSipMapSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48),
              Text("SIP’s MAKE A WAVE AROUND THE WORLD",
                  style: PhinexaFont.headingLarge),
              SizedBox(height: 12),
              Text(
                "Explore the global impact of GL2 through our interactive map. Click on any location to discover Sustainable Impact Projects (SIPs).",
                style: PhinexaFont.contentRegular,
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 24),
              CustomButton(
                label: "Explore More",
                height: 40,
                onPressed: () {
                  context.pushNamed(RouteName.worldMap);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<List<String>> _getUserSurveyNames(WidgetRef ref, String email) async {
    try {
      return await retrieveSurveyNames(ref, email);
    } catch (error) {
      print("Failed to retrieve survey names: $error");
      return [];
    }
  }
}
