import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/route/route_name.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Login Screen"),
            IconButton(onPressed: () {
              context.pushNamed(RouteName.signup);
            }, icon: const Icon(Icons.login_outlined)),
          ],
        ),
      )
    );
  }
}