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
                InkWell(
                  onTap: () => context.pushNamed(RouteName.profile),
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isLoading
                        ? Shimmer(
                            gradient: const LinearGradient(
                              colors: [Colors.grey, Colors.white],
                            ),
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey,
                            ),
                          )
                        : userData?['profileImage'] != null &&
                              (userData!['profileImage'] as String).isNotEmpty
                        ? CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: NetworkImage(
                              userData!['profileImage'],
                            ),
                          )
                        : const CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFFE0E0E0),
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ref
                      .watch(userProvider)
                      .when(
                        data: (user) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getGreeting(),
                              style: PhinexaFont.captionEmphasis.copyWith(
                                color: PhinexaColor.darkGrey,
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                user?.fullName ?? 'Guest',
                                style: PhinexaFont.contentEmphasis,
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
                              style: PhinexaFont.labelRegular.copyWith(
                                color: PhinexaColor.darkGrey,
                              ),
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
                              style: PhinexaFont.labelRegular.copyWith(
                                color: PhinexaColor.darkGrey,
                              ),
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
                    Transform.translate(
                      offset: Offset(0, -30),
                      child: _buildHowItWorksSection(),
                    ),
                    _buildEventSection(ref),
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
              text: 'Welcome to Global Learning Lab',
              style: PhinexaFont.headingExLarge,
            ),
          ),
          SizedBox(height: 24),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'You’re not just here to learn-you’re here to lead.',
              style: PhinexaFont.highlightRegular,
            ),
          ),
          SizedBox(height: 24),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'This is your space to grow your skills, launch real change, and connect with a global community of young leaders.',
              style: PhinexaFont.highlightRegular,
            ),
          ),
          SizedBox(height: 24),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'Whether you’re starting your journey or already deep into your Sustainable Impact Project, you belong here-and we’re so glad you showed up.',
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
        final hasRegistered =
            snapshot.data?.contains(
              'Pre_Survey_${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}',
            ) ??
            false;

        return _buildEventSectionContent(context, ref, event, hasRegistered);
      },
    );
  }

  Widget _buildEventSectionContent(
    BuildContext context,
    WidgetRef ref,
    Event event,
    bool hasRegistered,
  ) {
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
              Text("Start Training", style: PhinexaFont.headingLarge),
              TextButton(
                onPressed: () {
                  ref.read(navProvider.notifier).onItemTapped(2);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: PhinexaColor.darkGrey,
                    ),
                  ],
                ),
              ),
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
              Text(
                event.title,
                style: PhinexaFont.featureAccent,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: PhinexaColor.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    _formatDate(event.startDate, event.endDate),
                    style: PhinexaFont.captionRegular.copyWith(
                      color: PhinexaColor.grey,
                    ),
                  ),
                ],
              ),
              if (!hasRegistered)
                Column(
                  children: [
                    SizedBox(height: 12),
                    CustomButton(
                      label: "Register Now",
                      height: 40,
                      onPressed: () {
                        context.pushNamed(
                          RouteName.registrationForm,
                          extra: {
                            'isTTT': event.isTTT,
                            'eventIdentity':
                                '${event.title}_${DateFormat('yyyy_MM_dd').format(event.startDate)}',
                          },
                        );
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
              child: SvgPicture.asset(
                'assets/home/home_screen_bg_2.svg',
                fit: BoxFit.fill,
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
              Text(
                "Your Leadership Journey: LA → SIP → TTT",
                style: PhinexaFont.headingSmall,
              ),
              SizedBox(height: 12),
              Text(
                "Leadership Academy (LA):",
                style: PhinexaFont.highlightAccent,
              ),
              SizedBox(height: 4),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "Where it all begins. LA is hands-on, real-world, and all about you—building the mindset, skills, and confidence to lead positive change. During LA, you’ll create the vision and foundation for your Sustainable Impact Project (SIP).",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Sustainable Impact Project (SIP):",
                style: PhinexaFont.highlightAccent,
              ),
              SizedBox(height: 4),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "Your chance to say:",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "“I see something that needs to change, and I’m going to do something about it.”",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "You design it. You lead it. You make it real. Whether it’s a campaign, workshop, garden, or podcast—your SIP creates lasting impact in your community, with mentorship and support along the way.",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                  ),
                ),
              ),

              SizedBox(height: 12),
              Text(
                "Train the Trainer (TTT):",
                style: PhinexaFont.highlightAccent,
              ),
              SizedBox(height: 4),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "Ready to lead others? TTT is your next step. You’ll build the confidence, tools, and facilitation skills to train future changemakers and lead your own Leadership Academies.",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                "LA + SIP + TTT = a global ripple effect.",
                style: PhinexaFont.highlightAccent,
              ),
              SizedBox(height: 24),
              Text(
                "Sustainable Impact Project (SIP):",
                style: PhinexaFont.headingSmall,
              ),
              SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "Your chance to say:   ",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                  ),
                ),
              ),
              SizedBox(height: 4),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "“I see something that needs to change, and I’m going to do something about it.”",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                  ),
                ),
              ),
              SizedBox(height: 4),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "You design it. You lead it. You make it real. Whether it’s a campaign, workshop, garden, or podcast—your SIP creates lasting impact in your community, with mentorship and support along the way.",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(
            'assets/home/home_screen_bg_4.svg',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: "Path to Global Trainer",
                  style: PhinexaFont.featureEmphasis,
                ),
              ),
              SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "From participant to leader to global change maker.",
                  style: PhinexaFont.highlightEmphasis,
                ),
              ),
              SizedBox(height: 4),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "The path to becoming a Global Trainer starts with the Leadership Academy and continues through your Sustainable Impact Project, and grows through experience, mentorship, and impact. It's a journey of leadership, facilitation, and paying what you have received forward.",
                  style: PhinexaFont.contentRegular.copyWith(
                    color: PhinexaColor.darkGrey,
                  ),
                ),
              ),
              SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  text: "Ready to see how it all connects?",
                  style: PhinexaFont.highlightRegular,
                ),
              ),
              SizedBox(height: 16),
              CustomButton(
                label: "Explore the Cascading Model",
                height: 40,
                onPressed: () {
                  context.pushNamed(
                    RouteName.pdfViewer,
                    extra: "assets/pdf/casacading_model.pdf",
                  );
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
              Text(
                "Explore the Global Wave of Change",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "Each SIP starts with one idea, one ripple. All together, they’re making waves around the world.",
                  style: PhinexaFont.contentRegular,
                ),
              ),
              SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      "Use the interactive map below to explore the global impact of Sustainable Impact Projects (SIPs).  Click on any location marked with a star to discover SIPs led by young changemakers like you, and get inspired!",
                  style: PhinexaFont.contentRegular,
                ),
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
              SizedBox(height: 90),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Empowering Youth to Lead and Innovate Globally",
                  style: PhinexaFont.headingDoubleExLargeExBold.copyWith(
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 90),
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

String _formatDate(DateTime startDate, DateTime endDate) {
  final dateFormat = DateFormat('MMMM d, yyyy');

  // Check if the start and end dates are the same
  if (startDate.year == endDate.year &&
      startDate.month == endDate.month &&
      startDate.day == endDate.day) {
    return dateFormat.format(startDate);
  } else {
    // If the dates are different, format as "Month day1-day2, yyyy"
    final startDay = DateFormat('MMMM d').format(startDate);
    final endDay = DateFormat('d, yyyy').format(endDate);
    return '$startDay-$endDay';
  }
}
