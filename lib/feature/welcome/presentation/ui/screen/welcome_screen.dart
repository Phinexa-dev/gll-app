import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Screen'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Welcome Screen"),
              IconButton(onPressed: () {
                context.pushNamed(RouteName.signup);
              }, icon: const Icon(Icons.login_outlined)),
            ],
          ),
        )
    );
  }
}