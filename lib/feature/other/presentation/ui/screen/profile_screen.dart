import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:gll/feature/other/presentation/ui/widget/custom_toggle_bar.dart';
import 'package:gll/feature/other/presentation/ui/widget/profile_cover.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/route/route_name.dart';
import '../provider/toggle_button_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final toggleButtonState = ref.watch(toggleButtonProvider);

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
            Text('Bryan Cotly', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('bcotly@gll.com', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      label: 'Edit Profile',
                      textColour: Colors.white,
                      onPressed: () => context.pushNamed(RouteName.editProfile),
                      iconVisible: true,
                      icon: Icons.chevron_right,
                      color: Colors.blue,
                      btnSize: 'small',
                      iconColor: Colors.white,
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    label: 'Settings',
                    textColour: Colors.black,
                    onPressed: () => context.pushNamed(RouteName.settings),
                    iconVisible: true,
                    icon: Icons.settings,
                    color: Colors.white,
                    btnSize: 'small',
                    borderColor: Colors.blue,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey,),
            SizedBox(height: 10),

            // toggle information
            CustomToggleBar(),

            // display the selected information
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  if(toggleButtonState[0]) ...[
                    ListTile(
                      title: Text('Personal Information'),
                      subtitle: Text('Bryan Cotly'),
                    ),
                  ],
                  if(toggleButtonState[1]) ...[
                    ListTile(
                      title: Text('Educational Information'),
                      subtitle: Text('Bryan Cotly'),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 10),
            
            // footer
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("Respect user privacy. Do not share or misuse profile information.",textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey)),
            )
        ],
      )
      ),
    );
  }
}