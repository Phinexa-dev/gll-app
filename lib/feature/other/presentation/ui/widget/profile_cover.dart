import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCover extends ConsumerStatefulWidget {

  final bool editEnabled;

  const ProfileCover({
    super.key,
    this.editEnabled = false,
  });

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
      height: MediaQuery.of(context).size.height * 0.28,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // cover image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.22,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: SvgPicture.asset(
                    'assets/more/cover_image_of_profile_screen.svg',
                    fit: BoxFit.cover
                )
            ),
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
                radius: MediaQuery.of(context).size.height * 0.054,
                backgroundImage: AssetImage('assets/more/mock_user_profile.png'),
              ),
            ),
          ),

          // Edit button
          if(widget.editEnabled)
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.0,
              right: MediaQuery.of(context).size.width * 0.28,
              child: GestureDetector(
                onTap: () {
                  // TODO: implement edit profile
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF3993A1),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFFC6E9F5),
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFF3993A1),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}