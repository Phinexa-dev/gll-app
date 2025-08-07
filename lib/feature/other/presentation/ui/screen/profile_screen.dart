import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

// --- ADD THESE IMPORTS ---
import '../../../../../core/data/local/auth/auth_notifier.dart';
import '../../../../../core/data/local/user/user_service.dart';
import '../../../../../core/data/remote/network_service.dart';
import '../../../../../core/data/remote/token/token_service.dart';
import '../../../../../core/route/route_name.dart';
import '../../../../bottom_bar/presentation/ui/provider/nav_provider.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';
// --- END OF ADDED IMPORTS ---

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
    final socialData = ref.watch(profileControllerProvider).form;
    final skillsState = ref.watch(skillControllerProvider);
    final educationState = ref.watch(educationControllerProvider);
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
                  color: const Color(0xFF3993A1),
                  iconColor: Colors.white,
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  label: 'Delete Account',
                  isBold: true,
                  textColour: Colors.white,
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Deletion'),
                          content: const Text(
                              'Are you sure you want to delete your account? This action cannot be undone.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.red),
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirm == true) {
                      // --- MODIFIED LOGIC ---
                      try {
                        await ref
                            .read(profileControllerProvider.notifier)
                            .deleteProfile();
                      } catch (e, s) {
                        // Optionally log the error for debugging purposes.
                        debugPrint('Failed to delete profile from server: $e');
                        debugPrint(s.toString());
                      } finally {
                        // This block runs whether the deleteProfile call succeeded or failed.
                        // It ensures the user is always logged out locally.

                        // 1. Get all necessary services
                        final dio = ref.read(networkServiceProvider);
                        final userService = ref.read(userServiceProvider(dio));
                        final tokenService =
                            ref.read(tokenServiceProvider(dio));
                        final authNotifier =
                            ref.read(routerNotifierProvider(dio));
                        final feedbackService =
                            ref.read(feedbackServiceProvider);

                        // 2. Clear all local user data and tokens
                        await userService.clearUser();
                        await tokenService.clearTokens();

                        // 3. Notify the router of the auth state change
                        await authNotifier.updateAuthState();

                        // 4. Reset the bottom nav bar to the first item
                        ref.read(navProvider.notifier).onItemTapped(0);

                        // 5. Show feedback to the user
                        feedbackService.showToast(
                            "Account deleted. You have been logged out.");

                        // 6. Navigate to the welcome screen
                        if (context.mounted) {
                          context.goNamed(RouteName.welcome);
                        }
                      }
                    }
                  },
                  iconVisible: true,
                  icon: Icons.delete,
                  color: Colors.red,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 10),

          // --- Rest of your UI code remains the same ---
          const CustomToggleBar(),

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
                            showModalBottomSheet(
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
                            )
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
                                showModalBottomSheet(
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
                      onPressedAdd: () => {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              backgroundColor: Colors.white,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return AddEducationalHistory();
                              },
                            ).whenComplete(() {
                              // TODO: empty the unsaved form data
                            })
                          }),
                  const SizedBox(height: 10),
                ],
              ],
            ),
          ),
          const SizedBox(height: 5),

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
