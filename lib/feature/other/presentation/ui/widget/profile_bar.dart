import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/data/local/auth/auth_notifier.dart';
import '../../../../../core/data/local/user/user_service.dart';
import '../../../../../core/data/remote/network_service.dart';
import '../../../../../core/data/remote/token/token_service.dart';
import '../../../../../core/route/route_name.dart';
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Brian Cotly', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('bcotly@gll.com', style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
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