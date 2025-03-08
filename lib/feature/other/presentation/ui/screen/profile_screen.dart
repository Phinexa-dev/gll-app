import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_icon_button.dart';
import 'package:gll/feature/other/presentation/ui/provider/professional_skills_provider.dart';
import 'package:gll/feature/other/presentation/ui/provider/social_information_provider.dart';
import 'package:gll/feature/other/presentation/ui/widget/certifications.dart';
import 'package:gll/feature/other/presentation/ui/widget/custom_toggle_bar.dart';
import 'package:gll/feature/other/presentation/ui/widget/educational_history/add_educational_history.dart';
import 'package:gll/feature/other/presentation/ui/widget/educational_history/edit_educational_history.dart';
import 'package:gll/feature/other/presentation/ui/widget/info_table.dart';
import 'package:gll/feature/other/presentation/ui/widget/profile_cover.dart';
import 'package:gll/feature/other/presentation/ui/widget/skills/manage_skills.dart';
import 'package:gll/feature/other/presentation/ui/widget/socials/edit_socials.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/route/route_name.dart';
import '../../controller/skill/skill_controller.dart';
import '../provider/certification_provider.dart';
import '../provider/education_history_provider.dart';
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.share_outlined),
            SizedBox(width: 15),
            Icon(Icons.more_vert_outlined),
          ],
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // profile & cover image
            ProfileCover(),

            // user information
            Text('Bryan Cotly', style: PhinexaFont.headingESmall.copyWith(fontWeight: FontWeight.bold)),
            Text('bcotly@gll.com', style: PhinexaFont.captionRegular.copyWith(color: Colors.grey)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                      label: 'Edit Profile',
                      textColour: Colors.white,
                      onPressed: () => context.pushNamed(RouteName.editProfile),
                      iconVisible: true,
                      icon: Icons.chevron_right,
                      color: Colors.blue,
                      iconColor: Colors.white,
                  ),
                  SizedBox(width: 10),
                  CustomIconButton(
                    label: 'Settings',
                    textColour: Colors.black,
                    onPressed: () => context.pushNamed(RouteName.settings),
                    iconVisible: true,
                    icon: Icons.settings,
                    color: Colors.white,
                    borderColor: Colors.blue,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey,),
            SizedBox(height: 10),

            // toggle information
            CustomToggleBar(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  // personal information
                  if(toggleButtonState[0]) ...[
                    InfoTableWidget(
                        caption: 'Contact Information',
                        data: contactData,
                    ),
                    InfoTableWidget(
                        caption: 'Socials',
                        data: socialData,
                        onPressed: ()=>{
                          // ref.read(animationVisibilityProvider.notifier).state = false;
                          // open the signup overlay
                          showModalBottomSheet(
                            // transitionAnimationController: _signUpAnimationController,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            backgroundColor: Colors.white,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return const EditSocials();
                            },
                          ).whenComplete(() {
                            // ref.read(animationVisibilityProvider.notifier).state = true;
                          })
                        }
                    ),
                    Stack(
                      children: [
                        Positioned(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1 + skillsData.length * MediaQuery.of(context).size.height * 0.06,
                            child: SvgPicture.asset(
                              'assets/more/profile_skills_bg.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SkillsTableWidget(
                            caption: 'Professional Skills',
                            color: Colors.black,
                            data: skillsData,
                            onPressed: ()=>{
                              // ref.read(animationVisibilityProvider.notifier).state = false;
                              // open the signup overlay
                              showModalBottomSheet(
                                // transitionAnimationController: _signUpAnimationController,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                ),
                                backgroundColor: Colors.white,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return const ManageSkills();
                                },
                              ).whenComplete(() {
                                // ref.read(animationVisibilityProvider.notifier).state = true;
                              })
                            }
                        ),
                      ],
                    ),
                  ],

                  // educational information
                  if(toggleButtonState[1]) ...[
                    EducationHistory(
                        caption: 'Education History',
                        color: Colors.black,
                        data: educationData,
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
                        onPressedAdd: ()=>{
                          // ref.read(animationVisibilityProvider.notifier).state = false;
                          // open the signup overlay
                          showModalBottomSheet(
                            // transitionAnimationController: _signUpAnimationController,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            backgroundColor: Colors.white,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              // return unimplemented
                              return AddEducationalHistory();
                            },
                          ).whenComplete(() {
                            // ref.read(animationVisibilityProvider.notifier).state = true;
                          })
                        }
                    ),

                    SizedBox(height: 10),

                    Certifications(
                        caption: 'GLL Programs and Certifications',
                        color: Colors.black,
                        data: certificationData,
                    ),
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
                child: Text("Respect user privacy. Do not share or misuse profile information.",textAlign: TextAlign.center, style: PhinexaFont.footnoteRegular.copyWith(fontSize: 11, color: Colors.grey)),
              ),
            )
        ],
      )
      ),
    );
  }
}