import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart'; // Import the package
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
    final phoneNumberState = ref.watch(phoneNumberProvider);

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
              // Country Code Dropdown with Search
              SizedBox(
                width: 100, // Adjust width as needed
                child: DropdownSearch<String>(
                  // CORRECTED: The 'items' parameter itself expects the async function
                  // for finding/filtering items in your version.
                  items: (String filter, [LoadProps? props]) async {
                    if (filter.isEmpty) {
                      return countryCodes.toSet().toList();
                    } else {
                      return countryCodes
                          .where((code) =>
                              code.toLowerCase().contains(filter.toLowerCase()))
                          .toSet()
                          .toList();
                    }
                  } as FutureOr<List<String>> Function(String, [LoadProps?]),
                  // Explicit cast
                  selectedItem:
                      countryCodes.contains(phoneNumberState.countryCode)
                          ? phoneNumberState.countryCode
                          : countryCodes.first,
                  onChanged: (newCode) {
                    if (newCode != null) {
                      ref
                          .read(phoneNumberProvider.notifier)
                          .updateCountryCode(newCode);
                      onCountryCodeChanged?.call(newCode);
                    }
                  },
                  popupProps: PopupProps.menu(
                    showSearchBox: true, // Enable search
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search country code...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    menuProps: MenuProps(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: BoxConstraints(
                        minWidth: 300,
                        maxHeight: 300), // Max height for the dropdown menu
                  ),
                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: PhinexaFont.labelRegular,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: PhinexaColor.grey),
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
                      suffixIcon: const Icon(Icons.keyboard_arrow_down,
                          color: PhinexaColor.black),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              // Custom Text Field for Phone Number
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    ref
                        .read(phoneNumberProvider.notifier)
                        .updatePhoneNumber(value);
                    onChanged?.call(value);
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
