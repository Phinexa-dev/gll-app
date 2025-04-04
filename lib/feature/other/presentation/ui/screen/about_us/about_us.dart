import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_icon_button.dart';
import 'package:gll/feature/other/presentation/ui/provider/social_information_provider.dart';
import 'package:gll/feature/other/presentation/ui/widget/certifications.dart';
import 'package:gll/feature/other/presentation/ui/widget/custom_toggle_bar.dart';
import 'package:gll/feature/other/presentation/ui/widget/educational_history/add_educational_history.dart';
import 'package:gll/feature/other/presentation/ui/widget/info_table.dart';
import 'package:gll/feature/other/presentation/ui/widget/profile_cover.dart';
import 'package:gll/feature/other/presentation/ui/widget/skills/manage_skills.dart';
import 'package:gll/feature/other/presentation/ui/widget/socials/edit_socials.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/route/route_name.dart';
import '../../../controller/skill/skill_controller.dart';
import '../../provider/certification_provider.dart';
import '../../provider/education_history_provider.dart';
import '../../provider/personal_detail_provider.dart';
import '../../provider/toggle_button_provider.dart';
import '../../widget/education_history.dart';
import '../../widget/skills/skills_table.dart';

class AboutUs extends ConsumerStatefulWidget {
  const AboutUs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutUsState();
}

class _AboutUsState extends ConsumerState<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final toggleButtonState = ref.watch(toggleButtonProvider);
    final contactData = ref.watch(personalDetailProvider);
    final socialData = ref.watch(socialInformationProvider);
    final skillsData = ref.watch(skillControllerProvider).skills;
    final educationData = ref.watch(educationHistoryProvider);
    final certificationData = ref.watch(certificationProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("About Us"),
              Icon(Icons.more_vert_outlined),
            ],
          ),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/more/about_us_bg.svg',
                      fit: BoxFit.cover,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        'Global Learning Lab (GL2) is a youth leadership development '
                            'organization operating in 6 countries across 3 continents. '
                            'By empowering young leaders, GL2 fosters sustainable community '
                            'impact projects and builds resilience through collaboration and mentorship.',
                        style: PhinexaFont.labelRegular.copyWith(
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),

                    Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            child: SvgPicture.asset(
                              'assets/more/how_it_works.svg',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Text(
                              'How it works',
                              style: PhinexaFont.headingSmall.copyWith(
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          ),
                        ),
                      ],
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0, top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Sustainable Impact Projects (SIPs)',
                                style: PhinexaFont.headingESmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Sustainable Impact Projects (SIPs) are the cornerstone of the Leadership Academy. '
                                  'They empower youth leaders to design and implement community-based projects '
                                  'that address local challenges, create measurable outcomes, and foster sustainable '
                                  'development.',
                              style: PhinexaFont.labelRegular.copyWith(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.justify,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            // height: MediaQuery.of(context).size.height * 0.1 + skillsData.length * MediaQuery.of(context).size.height * 0.06,
                            child: SvgPicture.asset(
                              'assets/more/leadership_bg.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 60.0, top: 50, left: 20.0, right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    'Leadership Academy (LA) vs. Train the Trainer (TTT)',
                                    style: PhinexaFont.headingESmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  'The Leadership Academy (LA) and Train-the-Trainer (TTT) programs are complementary components of GL2’s scalable youth leadership model. While LA focuses on empowering youth directly, TTT builds the capacity of trainers who can cascade the training to others.',
                                  style: PhinexaFont.labelRegular.copyWith(
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    SvgPicture.asset(
                      'assets/more/path_to_global_trainer.svg',
                      fit: BoxFit.cover,
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0, top: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Path to Global Trainer',
                                style: PhinexaFont.headingESmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'The Path to Global Trainer is a structured journey that transforms a '
                                  'Leadership Academy participant into a certified trainer and eventually '
                                  'a global leadership ambassador.',
                              style: PhinexaFont.labelRegular.copyWith(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.justify,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0, top: 30.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Text(
                                'Testimonials',
                                style: PhinexaFont.headingMedium,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _buildTestimonials(
                                  'assets/more/mock_user_profile.png',
                                  'Ananya, India',
                                  'Student Participant',
                                  'The Leadership Academy transformed me into a '
                                      'confident leader. I learned how to communicate '
                                      'effectively and create meaningful change in my community.',
                                ),
                                const SizedBox(height: 30),
                                _buildTestimonials(
                                  'assets/more/mock_user_profile.png',
                                  'Aleksandar, North Macedonia',
                                  'Teacher',
                                  'Through GL2, I gained the skills to lead my team and implement a '
                                      'project that improved the lives of hundreds in my village.',
                                ),
                                const SizedBox(height: 30),
                                _buildTestimonials(
                                  'assets/more/mock_user_profile.png',
                                  'Student Participant',
                                  'Global Trainer',
                                  'Becoming a certified trainer with GLL has been a life-changing experience. '
                                      'I’ve had the chance to guide young leaders and see their impact first-hand.',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45),
            ],
          )
      ),
    );
  }

  Widget _buildTestimonials(String imgUrl, String name, String role, String testimonial) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.03,
                backgroundImage: AssetImage(imgUrl),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: PhinexaFont.labelRegular.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      role,
                      style: PhinexaFont.labelRegular.copyWith(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          testimonial,
          style: PhinexaFont.labelRegular.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          textAlign: TextAlign.justify,
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}