import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../core/data/local/user/country_codes.dart';
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
  final List<Country> countries;
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
    this.selectedCountryCode,
    required this.countries,
    this.onChanged,
    this.onCountryCodeChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumberState = ref.watch(phoneNumberProvider);

    final sortedCountries = List<Country>.from(countries);
    sortedCountries.sort((a, b) => a.name.compareTo(b.name));

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
                width: 120,
                child: DropdownSearch<Country>(
                  items: (String filter, LoadProps? props) async {
                    await Future.delayed(const Duration(milliseconds: 50));
                    final lowerFilter = filter.toLowerCase().trim();

                    if (lowerFilter.isEmpty) return sortedCountries;

                    return sortedCountries.where((country) {
                      return country.name.toLowerCase().contains(lowerFilter) ||
                          country.abbreviation.toLowerCase().contains(
                            lowerFilter,
                          ) ||
                          country.code.toLowerCase().contains(lowerFilter);
                    }).toList();
                  },
                  compareFn: (Country country1, Country country2) {
                    return country1.code == country2.code;
                  },
                  itemAsString: (Country country) =>
                      '${country.name} (${country.abbreviation}, ${country.code})',
                  selectedItem: sortedCountries.firstWhere(
                    (country) => country.code == phoneNumberState.countryCode,
                    orElse: () => sortedCountries.first,
                  ),
                  onChanged: (newCountry) {
                    if (newCountry != null) {
                      ref
                          .read(phoneNumberProvider.notifier)
                          .updateCountryCode(newCountry.code);
                      onCountryCodeChanged?.call(newCountry.code);
                    }
                  },
                  dropdownBuilder: (context, selectedItem) {
                    if (selectedItem == null) return const Text("");
                    return Text(
                      '${selectedItem.code}',
                      style: PhinexaFont.labelRegular,
                    );
                  },
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    itemBuilder: (context, item, isDisabled, isSelected) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Text(
                          '${item.name} (${item.code})',
                          style: PhinexaFont.labelRegular,
                        ),
                      );
                    },
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                      ),
                    ),
                    menuProps: MenuProps(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 300,
                      maxHeight: 300,
                    ),
                  ),
                  decoratorProps: DropDownDecoratorProps(
                    baseStyle: PhinexaFont.labelRegular,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: PhinexaColor.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: PhinexaColor.grey),
                      ),
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: PhinexaColor.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
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
                      borderSide: const BorderSide(color: PhinexaColor.grey),
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
