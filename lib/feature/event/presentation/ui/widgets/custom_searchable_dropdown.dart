import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomSearchableDropdown extends StatelessWidget {
  final String fieldName;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final List<String> items;
  final String hintText;
  final String searchHintText;
  final double? popupWidth;
  final double fieldWidth;

  const CustomSearchableDropdown({
    super.key,
    required this.fieldName,
    this.selectedValue,
    required this.onChanged,
    required this.items,
    required this.hintText,
    this.searchHintText = "Search...",
    this.popupWidth,
    required this.fieldWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            fieldName,
            style: PhinexaFont.contentRegular,
          ),
        ),
        SizedBox(
          width: fieldWidth,
          child: DropdownSearch<String>(
            items: (String filter, [LoadProps? props]) async {
              if (filter.isEmpty) {
                return items.toSet().toList();
              } else {
                return items
                    .where((item) =>
                        item.toLowerCase().contains(filter.toLowerCase()))
                    .toSet()
                    .toList();
              }
            } as FutureOr<List<String>> Function(String, [LoadProps?]),
            selectedItem: items.contains(selectedValue) ? selectedValue : null,
            onChanged: onChanged,
            popupProps: PopupProps.menu(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: searchHintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
              menuProps: MenuProps(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            decoratorProps: DropDownDecoratorProps(
              baseStyle: PhinexaFont.labelRegular,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: PhinexaFont.highlightRegular
                    .copyWith(color: PhinexaColor.grey),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
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
      ],
    );
  }
}
