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
        border: Border.all(color: Color(0xFF3993A1), width: 1),
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
        color: Colors.grey,
        // Default text color
        selectedColor: Colors.black,
        // Text color when selected
        borderWidth: 1,
        constraints: const BoxConstraints(
          minHeight: 45,
          minWidth: 138,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
            child: Container(
                decoration: BoxDecoration(
                  color: toggleButtonState[0]
                      ? Color(0xFF3993A1).withAlpha(60)
                      : Colors.white,
                  border: toggleButtonState[0]
                      ? Border.all(color: Color(0xFF3993A1), width: 1)
                      : null,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                constraints: const BoxConstraints(
                  minWidth: 120,
                  minHeight: 40,
                ),
                child: Center(
                  child: Text('Personal',
                      style: PhinexaFont.contentRegular.copyWith(
                          color:
                              toggleButtonState[0] ? Colors.black : Colors.grey,
                          fontWeight: toggleButtonState[0]
                              ? FontWeight.bold
                              : FontWeight.normal)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: toggleButtonState[1]
                    ? Color(0xFF3993A1).withAlpha(60)
                    : Colors.white,
                border: toggleButtonState[1]
                    ? Border.all(color: Color(0xFF3993A1), width: 1)
                    : null,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              constraints: const BoxConstraints(
                minWidth: 120,
                minHeight: 40,
              ),
              child: Center(
                child: Text('Educational',
                    style: PhinexaFont.contentRegular.copyWith(
                        color:
                            toggleButtonState[1] ? Colors.black : Colors.grey,
                        fontWeight: toggleButtonState[1]
                            ? FontWeight.bold
                            : FontWeight.normal)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
