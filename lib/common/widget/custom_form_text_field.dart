import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomFormTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool enabled;
  final int? maxLines;
  final bool autofocus;
  final double? height;
  final Widget? customLabelText;

  const CustomFormTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.onChanged,
      this.onSubmitted,
      this.enabled = true,
      this.maxLines = 1,
      this.autofocus = false,
      this.height,
      this.customLabelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (customLabelText != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: customLabelText!,
          )
        else if (labelText != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              labelText!,
              style: PhinexaFont.contentRegular,
            ),
          ),
        Container(
          height: height,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            enabled: enabled,
            autofocus: autofocus,
            maxLines: maxLines,
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
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: PhinexaColor.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
