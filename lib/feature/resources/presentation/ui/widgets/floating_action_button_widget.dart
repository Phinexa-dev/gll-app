import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/route/route_name.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: () {
        // Login logic
        context.pushNamed(RouteName.createSip);
      },
      backgroundColor: PhinexaColor.primaryColor,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
