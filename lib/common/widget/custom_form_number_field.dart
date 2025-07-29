import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../feature/home/presentation/ui/provider/ phone_number_provider.dart';

class CustomPhoneNumberField extends ConsumerWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool enabled;
  final int? maxLines;
  final bool autofocus;
  final double? height;
  final String? selectedCountryCode;
  final List<String> countryCodes;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onCountryCodeChanged;

  const CustomPhoneNumberField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.done,
    this.enabled = true,
    this.maxLines = 1,
    this.autofocus = false,
    this.height,
    this.selectedCountryCode = "+1",
    required this.countryCodes,
    this.onChanged,
    this.onCountryCodeChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use Riverpod state
    final phoneNumberState = ref.watch(phoneNumberProvider); // Watch the state

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              labelText!,
              style: PhinexaFont.contentRegular,
            ),
          ),
        Container(
          height: height,
          child: Row(
            children: [
              Container(
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: PhinexaColor.grey),
                ),
                child: DropdownButton<String>(
                  menuMaxHeight: 300.0,
                  value: countryCodes.contains(phoneNumberState.countryCode)
                      ? phoneNumberState.countryCode
                      : countryCodes.first,
                  padding: EdgeInsets.only(left: 12, right: 8),
                  style: PhinexaFont.labelRegular,
                  borderRadius: BorderRadius.circular(12),
                  onChanged: (newCode) {
                    if (newCode != null) {
                      ref
                          .read(phoneNumberProvider.notifier)
                          .updateCountryCode(newCode);
                    }
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                  underline: SizedBox(),
                  isExpanded: true,
                  items: countryCodes
                      .toSet()
                      .toList()
                      .map((code) => DropdownMenuItem<String>(
                            value: code,
                            child: Text(code),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(width: 8),
              // Custom Text Field for Phone Number
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  onChanged: (value) {
                    ref
                        .read(phoneNumberProvider.notifier)
                        .updatePhoneNumber(value);
                  },
                  enabled: enabled,
                  autofocus: autofocus,
                  maxLines: maxLines,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintStyle: PhinexaFont.highlightRegular
                        .copyWith(color: PhinexaColor.grey),
                    hintText: hintText,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: PhinexaColor.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
