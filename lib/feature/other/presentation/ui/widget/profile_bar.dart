import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../../../core/data/local/auth/auth_notifier.dart';
import '../../../../../core/data/local/user/user_service.dart';
import '../../../../../core/data/remote/network_service.dart';
import '../../../../../core/data/remote/token/token_service.dart';
import '../../../../../core/presentation/provider/user_notifier_provider.dart';
import '../../../../system_feedback/provider/feedback_provider.dart';

class ProfileBar extends ConsumerStatefulWidget {
  const ProfileBar({super.key});

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
    final userState = ref.watch(userNotifierProvider);
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
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[400],
            backgroundImage: AssetImage('assets/more/mock_user_profile.png'),
          ),
          const SizedBox(width: 12),
          ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: 200), // Adjust this value as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userState.user?.fullName ?? 'Guest',
                  style: PhinexaFont.highlightAccent,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  userState.user?.email ?? 'Email',
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
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () async {
              // Handle logout

              // TODO: temporary solution
              final userService = ref.read(userServiceProvider);
              final dio = ref.read(networkServiceProvider);
              final tokenService = ref.read(tokenServiceProvider(dio));

              await userService.clearUser();
              await tokenService.clearTokens();

              // notify the router
              final authNotifier = ref.read(routerNotifierProvider);
              await authNotifier.updateAuthState();

              final feedbackService = ref.read(feedbackServiceProvider);
              feedbackService.showToast("Logged Out");
            },
          ),
        ],
      ),
    );
  }
}
