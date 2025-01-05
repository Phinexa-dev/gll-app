import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCover extends ConsumerStatefulWidget {
  const ProfileCover({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileCoverState();
}

class _ProfileCoverState extends ConsumerState<ProfileCover> {

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
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.01),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // cover image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.19,
            child: SvgPicture.asset('assets/more/cover_image_of_more_screen.svg', fit: BoxFit.cover),
          ),
          // profile image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.06,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.05,
                backgroundImage: AssetImage('assets/more/mock_user_profile.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}