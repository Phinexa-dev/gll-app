import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleButtonProvider = StateNotifierProvider<ToggleButtonNotifier, List<bool>>((ref) {
  return ToggleButtonNotifier();
});

class ToggleButtonNotifier extends StateNotifier<List<bool>> {
  ToggleButtonNotifier() : super([true, false]);

  void toggle(int index) {
    state = List.generate(
      state.length,
          (i) => i == index,
    );
  }
}
