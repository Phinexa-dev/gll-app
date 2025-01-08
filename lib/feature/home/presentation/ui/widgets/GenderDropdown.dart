import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?> onChanged;

  const GenderDropdown({
    super.key,
    this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the dropdown
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Gender',
            style: PhinexaFont.contentRegular,
          ),
        ),
        // Dropdown field
        DropdownButtonFormField<String>(
          style: PhinexaFont.contentRegular,
          decoration: InputDecoration(
            labelText: null,
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
          ),
          value: selectedGender,
          hint: Text(
            'Select Gender',
            style: PhinexaFont.contentRegular.copyWith(color: PhinexaColor.grey),
          ),
          items: ['Male', 'Female', 'Other']
              .map((gender) => DropdownMenuItem<String>(
            value: gender,
            child: Text(gender),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
