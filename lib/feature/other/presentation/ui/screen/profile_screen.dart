import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_icon_button.dart';
import 'package:gll/feature/other/presentation/ui/widget/custom_toggle_bar.dart';
import 'package:gll/feature/other/presentation/ui/widget/educational_history/add_educational_history.dart';
import 'package:gll/feature/other/presentation/ui/widget/info_table.dart';
import 'package:gll/feature/other/presentation/ui/widget/profile_cover.dart';
import 'package:gll/feature/other/presentation/ui/widget/skills/manage_skills.dart';
import 'package:gll/feature/other/presentation/ui/widget/socials/edit_socials.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/data/local/user/user_service.dart';
import '../../../../../core/route/route_name.dart';
import '../../controller/education/education_controller.dart';
import '../../controller/profile/profile_controller.dart';
import '../../controller/skill/skill_controller.dart';
import '../provider/certification_provider.dart';
import '../provider/personal_detail_provider.dart';
import '../provider/toggle_button_provider.dart';
import '../widget/education_history.dart';
import '../widget/skills/skills_table.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    // fetch data needed
    Future.microtask(() {
      ref.read(skillControllerProvider.notifier).getSkills();
      ref.read(profileControllerProvider.notifier).updateFormData();
      ref.read(educationControllerProvider.notifier).getEducationData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final toggleButtonState = ref.watch(toggleButtonProvider);
    final contactData = ref.watch(personalDetailProvider);
    final socialData = ref.watch(profileControllerProvider).form;
    final skillsState = ref.watch(skillControllerProvider);
    final educationState = ref.watch(educationControllerProvider);
    final certificationData = ref.watch(certificationProvider);
    final profileState = ref.watch(profileControllerProvider);

    final userAsync = ref.watch(userProvider);
    final skills = skillsState.skills;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile ',
          style: PhinexaFont.headingESmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // profile & cover image
          ProfileCover(
            profileImage: socialData?["profileImage"] ??
                'assets/more/mock_user_profile.png',
          ),

          // user information
          userAsync.when(
            data: (user) {
              return Column(
                children: [
                  Text(
                    user?.fullName ?? "Guest",
                    style: PhinexaFont.headingESmall
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user?.email ?? 'Email',
                    style:
                        PhinexaFont.captionRegular.copyWith(color: Colors.grey),
                  ),
                ],
              );
            },
            loading: () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 20,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) {
              return Text('Error loading user info: $error');
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  label: 'Edit Profile',
                  isBold: true,
                  textColour: Colors.white,
                  onPressed: () => context.pushNamed(RouteName.editProfile),
                  iconVisible: true,
                  icon: Icons.chevron_right,
                  color: Color(0xFF3993A1),
                  iconColor: Colors.white,
                ),
                SizedBox(width: 10),
                // CustomIconButton(
                //   label: 'Settings',
                //   isBold: true,
                //   textColour: Colors.black,
                //   onPressed: () => context.pushNamed(RouteName.settings),
                //   iconVisible: true,
                //   icon: Icons.settings,
                //   color: Colors.white,
                //   borderColor: Color(0xFF3993A1),
                // ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(height: 10),

          // toggle information
          CustomToggleBar(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                // personal information
                if (toggleButtonState[0]) ...[
                  InfoTableWidget(
                    caption: 'Personal Details',
                    data: socialData == null
                        ? null
                        : Map.fromEntries(
                            socialData.entries.where((e) => [
                                  'Contact Number',
                                  'Location',
                                  'Languages',
                                  'Interests'
                                ].contains(e.key)),
                          ),
                    isLoading: profileState.isLoading,
                  ),
                  InfoTableWidget(
                      caption: 'Socials',
                      data: socialData == null
                          ? null
                          : Map.fromEntries(
                              socialData.entries.where((e) => [
                                    'Facebook',
                                    'Personal Blog',
                                    'Twitter',
                                    'X',
                                    'Instagram'
                                  ].contains(e.key)),
                            ),
                      isLoading: profileState.isEditingSocials ||
                          profileState.isLoading,
                      onPressed: () => {
                            // ref.read(animationVisibilityProvider.notifier).state = false;
                            // open the signup overlay
                            showModalBottomSheet(
                              // transitionAnimationController: _signUpAnimationController,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              backgroundColor: Colors.white,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const EditSocials();
                              },
                            ).whenComplete(() {
                              // ref.read(animationVisibilityProvider.notifier).state = true;
                            })
                          }),
                  Stack(
                    children: [
                      Positioned(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1 +
                              (skillsState.isLoading ? 3 : skills.length) *
                                  MediaQuery.of(context).size.height *
                                  0.06,
                          child: SvgPicture.asset(
                            'assets/more/profile_skills_bg.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SkillsTableWidget(
                          caption: 'Professional Skills',
                          color: Colors.black,
                          data: skillsState.skills,
                          onPressed: () => {
                                // ref.read(animationVisibilityProvider.notifier).state = false;
                                // open the signup overlay
                                showModalBottomSheet(
                                  // transitionAnimationController: _signUpAnimationController,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  backgroundColor: Colors.white,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return const ManageSkills();
                                  },
                                ).whenComplete(() {
                                  // ref.read(animationVisibilityProvider.notifier).state = true;
                                  // remove all unsaved skills
                                  ref
                                      .read(skillControllerProvider.notifier)
                                      .removeUnsavedSkills();
                                })
                              }),
                    ],
                  ),
                ],

                // educational information
                if (toggleButtonState[1]) ...[
                  EducationHistory(
                      caption: 'Education History',
                      color: Colors.black,
                      data: educationState.educationData,
                      // onPressedEdit: ()=>{
                      //   // ref.read(animationVisibilityProvider.notifier).state = false;
                      //   // open the signup overlay
                      //   showModalBottomSheet(
                      //     // transitionAnimationController: _signUpAnimationController,
                      //     context: context,
                      //     shape: const RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      //     ),
                      //     backgroundColor: Colors.white,
                      //     isScrollControlled: true,
                      //     builder: (BuildContext context) {
                      //       // return unimplemented
                      //       return EditEducationalHistory();
                      //     },
                      //   ).whenComplete(() {
                      //     // ref.read(animationVisibilityProvider.notifier).state = true;
                      //   })
                      // },
                      onPressedAdd: () => {
                            // ref.read(animationVisibilityProvider.notifier).state = false;
                            // open the signup overlay
                            showModalBottomSheet(
                              // transitionAnimationController: _signUpAnimationController,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              backgroundColor: Colors.white,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                // return unimplemented
                                return AddEducationalHistory();
                              },
                            ).whenComplete(() {
                              // ref.read(animationVisibilityProvider.notifier).state = true;
                              // TODO: empty the unsaved form data
                            })
                          }),
                  SizedBox(height: 10),
                  // Certifications(
                  //   caption: 'GLL Programs and Certifications',
                  //   color: Colors.black,
                  //   data: certificationData,
                  // ),
                ],
              ],
            ),
          ),
          SizedBox(height: 5),

          // footer
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                  "Respect user privacy. Do not share or misuse profile information.",
                  textAlign: TextAlign.center,
                  style: PhinexaFont.footnoteRegular
                      .copyWith(fontSize: 11, color: Colors.grey)),
            ),
          )
        ],
      )),
    );
  }
}
