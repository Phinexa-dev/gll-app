import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/route/route_name.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.pushNamed(RouteName.sipProjectOverviewScreen);
      },
      backgroundColor: PhinexaColor.primaryColor,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      label: const Text(
        "Upload SIP here",
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.upload, color: Colors.white),
    );
  }
}
