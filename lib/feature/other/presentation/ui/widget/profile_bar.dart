import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/widget/shimmer_box.dart';
import '../../../../../core/data/local/auth/auth_notifier.dart';
import '../../../../../core/data/local/user/user_service.dart';
import '../../../../../core/data/remote/network_service.dart';
import '../../../../../core/data/remote/token/token_service.dart';
import '../../../../bottom_bar/presentation/ui/provider/nav_provider.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';
import '../../controller/profile/profile_controller.dart';

class ProfileBar extends ConsumerStatefulWidget {
  const ProfileBar({
    super.key,
    required this.profileImage,
  });

  final String profileImage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileBarState();
}

class _ProfileBarState extends ConsumerState<ProfileBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userProvider);
    final isLoading = ref.watch(profileControllerProvider).isLoading;

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7).withAlpha(230),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Profile Picture
          userAsync.isLoading
              ? Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[300],
            ),
          )
              :
              isLoading?
          const Shimmer(
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
              :  // Profile Picture
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[400],
            backgroundImage: widget.profileImage.startsWith('assets')
                ? AssetImage(widget.profileImage)
                : widget.profileImage.startsWith('http')
                ? NetworkImage(widget.profileImage)
                : FileImage(File(widget.profileImage)) as ImageProvider,
          ),
          const SizedBox(width: 12),
          ConstrainedBox(
            constraints:
            BoxConstraints(maxWidth: 200), // Adjust this value as needed
            child: userAsync.isLoading
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shimmerBox(width: 100),
                const SizedBox(height: 4),
                shimmerBox(width: 140),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userAsync.value?.fullName ?? 'Guest',
                  style: PhinexaFont.highlightAccent,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  userAsync.value?.email ?? 'Email',
                  style: PhinexaFont.contentRegular
                      .copyWith(color: PhinexaColor.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.logout, color: Color(0xFFE87878)),
            onPressed: () async {
              // Handle logout

              final dio = ref.read(networkServiceProvider);
              final userService = ref.read(userServiceProvider(dio));
              final tokenService = ref.read(tokenServiceProvider(dio));

              if (dotenv.get('TEST_MODE', fallback: 'false') == 'false') {
                // TODO: should move to a necessary service rather than here
                await userService.clearUser();
                await tokenService.clearTokens();

                // notify the router
                final authNotifier = ref.read(routerNotifierProvider(dio));
                await authNotifier.updateAuthState();
                ref.read(navProvider.notifier).onItemTapped(0);
                final feedbackService = ref.read(feedbackServiceProvider);
                feedbackService.showToast("Logged Out");
              }
              else {
                // TEST: token expired situation
                final accessToken = "Jargon Web access Token";
                final refreshToken = "Jargon Web refresh Token";
                await tokenService.saveTokens(accessToken, refreshToken);
                ref.read(navProvider.notifier).onItemTapped(0);
                final feedbackService = ref.read(feedbackServiceProvider);
                feedbackService.showToast("Test: Tokens expired manually!!!");
              }
            },
          ),
        ],
      ),
    );
  }
}
