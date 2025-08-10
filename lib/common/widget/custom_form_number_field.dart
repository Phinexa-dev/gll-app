import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
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

    // MODIFICATION: Sort the country codes numerically before using them.
    final sortedCountryCodes = List<String>.from(countryCodes);
    sortedCountryCodes.sort((a, b) {
      final numA = int.tryParse(a.substring(1)) ?? 0;
      final numB = int.tryParse(b.substring(1)) ?? 0;
      return numA.compareTo(numB);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(labelText!, style: PhinexaFont.contentRegular),
          ),
        Container(
          height: height,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: DropdownSearch<String>(
                  items:
                      (String filter, [LoadProps? props]) async {
                            if (filter.isEmpty) {
                              // Use the sorted list
                              return sortedCountryCodes;
                            } else {
                              // Filter from the sorted list
                              return sortedCountryCodes
                                  .where(
                                    (code) => code.toLowerCase().contains(
                                      filter.toLowerCase(),
                                    ),
                                  )
                                  .toList();
                            }
                          }
                          as FutureOr<List<String>> Function(
                            String, [
                            LoadProps?,
                          ]),
                  selectedItem:
                      // Check for existence in the sorted list
                      sortedCountryCodes.contains(phoneNumberState.countryCode)
                      ? phoneNumberState.countryCode
                      : sortedCountryCodes.first,
                  onChanged: (newCode) {
                    if (newCode != null) {
                      ref
                          .read(phoneNumberProvider.notifier)
                          .updateCountryCode(newCode);
                      onCountryCodeChanged?.call(newCode);
                    }
                  },
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
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
                    constraints: BoxConstraints(minWidth: 300, maxHeight: 300),
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
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: PhinexaColor.grey),
                      ),
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: PhinexaColor.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintStyle: PhinexaFont.highlightRegular.copyWith(
                      color: PhinexaColor.grey,
                    ),
                    hintText: hintText,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
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
