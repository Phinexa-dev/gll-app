import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

class Logo extends ConsumerWidget {
  const Logo({
    super.key,
    this.heightFactor = 3,
  });

  final double heightFactor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height / heightFactor,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFFC6E9F5).withAlpha(51),
            Color(0xFF7EC899).withAlpha(38),
            Color(0xFF357F90).withAlpha(25),
            Colors.transparent,
          ],
          center: Alignment.topCenter,
          radius: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/welcome/logo.png',
                width: 95,
                height: 95,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'Global Learning Lab\n',
                      style: PhinexaFont.headingLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Connect, learn, and grow\n',
                      style: PhinexaFont.headingSmall.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'with our global community',
                      style: PhinexaFont.headingSmall.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
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
