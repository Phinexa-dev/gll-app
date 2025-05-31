import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/profile/profile_controller.dart';

class ProfileCover extends ConsumerStatefulWidget {
  final bool editEnabled;
  final String profileImage;

  // in click function
  final Function? onClick;

  const ProfileCover({
    super.key,
    this.editEnabled = false,
    required this.profileImage,
    this.onClick,
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
    final isLoading = ref.watch(profileControllerProvider).isLoading;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.01),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                      'assets/more/cover_image_of_profile_screen.jpg',
                      fit: BoxFit.cover)),
            ),
          ),
          // profile image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: isLoading
                ? Shimmer(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey,
                        Colors.white,
                      ],
                    ),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.06,
                      backgroundColor: Colors.grey,
                    ),
                  )
                : CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.06,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.054,
                      backgroundImage: widget.profileImage.startsWith('assets')
                          ? AssetImage(widget.profileImage)
                          : widget.profileImage.startsWith('http')
                              ? NetworkImage(widget.profileImage)
                              : FileImage(File(widget.profileImage))
                                  as ImageProvider,
                      onBackgroundImageError: (exception, stackTrace) {
                        debugPrint('Error loading profile image: $exception');
                      },
                    ),
                  ),
          ),

          // Edit button
          if (widget.editEnabled)
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.0,
              right: MediaQuery.of(context).size.width * 0.28,
              child: GestureDetector(
                onTap: () {
                  if (widget.onClick != null) {
                    widget.onClick!();
                  }
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
