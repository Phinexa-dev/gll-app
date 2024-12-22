import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class GetStarted extends ConsumerWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE5C36C),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 34,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                    shadowColor: Colors.yellow.withValues(),
                    splashFactory: InkSplash.splashFactory,
                  ),
                  onPressed: () {
                    // open the signup overlay
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right,
                        size: 30,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // open the login overlay
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: Color(0xFFE5C36C),
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
    );
  }
}