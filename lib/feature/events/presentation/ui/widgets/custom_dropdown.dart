import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomDropdown extends StatelessWidget {
  final String? selectedValue;
  final String fieldName;
  final ValueChanged<String?> onChanged;
  final List<String> items;
  final String hint;

  const CustomDropdown(
      {super.key,
      this.selectedValue,
      required this.fieldName,
      required this.onChanged,
      required this.items,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the dropdown
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            fieldName,
            style: PhinexaFont.contentRegular,
          ),
        ),
        // Dropdown field
        DropdownButtonFormField<String>(
          style: PhinexaFont.contentRegular,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: PhinexaColor.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          value: selectedValue,
          hint: Text(
            hint,
            style:
                PhinexaFont.contentRegular.copyWith(color: PhinexaColor.grey),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          items: items
              .map((gender) => DropdownMenuItem<String>(
                    value: gender,
                    child: Text(
                      gender,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          menuMaxHeight: items.length > 10 ? 400 : null,
          isExpanded: true,
        ),
      ],
    );
  }
}
