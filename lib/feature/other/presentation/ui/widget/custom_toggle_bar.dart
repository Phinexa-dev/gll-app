import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import '../provider/toggle_button_provider.dart';

class CustomToggleBar extends ConsumerWidget {
  const CustomToggleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleButtonState = ref.watch(toggleButtonProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ToggleButtons(
        isSelected: toggleButtonState,
        onPressed: (index) {
          ref.read(toggleButtonProvider.notifier).toggle(index);
        },
        renderBorder: false,
        borderRadius: BorderRadius.circular(100),
        fillColor: Colors.white,
        color: Colors.grey, // Default text color
        selectedColor: Colors.black, // Text color when selected
        borderWidth: 1,
        constraints: const BoxConstraints(
          minHeight: 45,
          minWidth: 130,
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              color: toggleButtonState[0]? Colors.blue.withAlpha(100) : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            constraints: const BoxConstraints(
              minWidth: 120,
              minHeight:40,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text('Personal', style: PhinexaFont.contentRegular.copyWith(color: toggleButtonState[0]? Colors.black : Colors.grey)),
          ),
          Container(
            decoration: BoxDecoration(
              color: toggleButtonState[1]? Colors.blue.withAlpha(100) : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            constraints: const BoxConstraints(
              minWidth: 120,
              minHeight:40,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text('Educational', style: PhinexaFont.contentRegular.copyWith(color: toggleButtonState[1]? Colors.black : Colors.grey)),
          ),
        ],
      ),
    );
  }
}