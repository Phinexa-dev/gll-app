import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForumScreen extends ConsumerStatefulWidget {
  const ForumScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForumScreenState();
}

class _ForumScreenState extends ConsumerState<ForumScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: const Center(child: Text('Forum Screen'))),
    );
  }
}