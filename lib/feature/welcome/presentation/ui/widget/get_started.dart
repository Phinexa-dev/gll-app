import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/theme/fonts.dart';
import '../../../../../core/route/route_name.dart';
import '../provider/animation_visibility_provider.dart';

class GetStarted extends ConsumerStatefulWidget {
  const GetStarted({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GetStartedState();
}

class _GetStartedState extends ConsumerState<GetStarted> with TickerProviderStateMixin {

  late AnimationController _signInAnimationController;
  late AnimationController _signUpAnimationController;

  @override
  void initState() {
    super.initState();
    _signInAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _signUpAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _signInAnimationController.dispose();
    _signUpAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final animationVisibility = ref.watch(animationVisibilityProvider);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: animationVisibility ? 1 : 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        transform: Matrix4.translationValues(
          0,
          animationVisibility ? 0 : 100,
          0,
        ),
        child: Stack(
          children: [
            // SVG as background
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/welcome/background.svg',
                fit: BoxFit.cover,
              ),
            ),
            // Gradient overlay for bottom part
            Positioned.fill(
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                    center: Alignment.bottomCenter,
                    radius: 0.7,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StartButton(
                      iconVisible: true,
                      isGlow: true,
                      label: 'Get Started',
                      onPressed: () {
                        // go to sign up screen
                        context.pushNamed(RouteName.signUp);
                      }
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // go to login screen
                        context.pushNamed(RouteName.signIn);
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: PhinexaFont.baseStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Log in',
                              style: PhinexaFont.baseStyle.copyWith(
                                color: Color(0xFF54AFBC),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}