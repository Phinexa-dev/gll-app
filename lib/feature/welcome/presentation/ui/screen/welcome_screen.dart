import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/get_started.dart';
import 'package:gll/feature/welcome/presentation/ui/widget/logo.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Top 1/3: Logo and description
          Logo(),
          // Bottom 2/3: Stack area
          Expanded(
            child: GetStarted(),
          ),
        ],
      ),
    );
  }
}