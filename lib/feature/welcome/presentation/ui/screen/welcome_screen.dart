import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/get_started.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/logo.dart';

import '../provider/animation_visibility_provider.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {

    final animationVisibility = ref.watch(animationVisibilityProvider);

    return Scaffold(
      backgroundColor: Color(0xFFC9EAF8),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: animationVisibility ? 1 : 0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          transform: Matrix4.translationValues(
            0,
            animationVisibility ? 0 : 100,
            0,
          ),
          child: Column(
            children: [
              // Top 1/3: Logo and description
              Logo(),
              // Bottom 2/3: Stack area
              Expanded(
                child: GetStarted(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}