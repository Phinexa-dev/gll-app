import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'nav_state.dart';
import 'nav_notifier.dart';

final navProvider = StateNotifierProvider<NavNotifier, NavState>((ref)=>
    NavNotifier()
);