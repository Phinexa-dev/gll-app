import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherScreen extends ConsumerStatefulWidget {
  const OtherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtherScreenState();
}

class _OtherScreenState extends ConsumerState<OtherScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: const Center(child: Text('More Screen'))),
    );
  }
}