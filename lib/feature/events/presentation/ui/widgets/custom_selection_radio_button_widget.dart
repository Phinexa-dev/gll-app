import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../provider/survey_radio_string_response_provider.dart';

class CustomSelectionRadioButtonWidget extends ConsumerStatefulWidget {
  final String question;

  const CustomSelectionRadioButtonWidget({
    super.key,
    required this.question,
  });

  @override
  _CustomSelectionRadioButtonWidgetState createState() =>
      _CustomSelectionRadioButtonWidgetState();
}

class _CustomSelectionRadioButtonWidgetState
    extends ConsumerState<CustomSelectionRadioButtonWidget> {
  final List<Map<String, String>> _options = [
    {
      "title": "Environment/Climate",
      "description":
          "Promoting environmental sustainability, conservation, and responsible resource management."
    },
    {
      "title": "Health",
      "description":
          "Supporting physical and mental health initiatives, access to healthcare, and overall well-being."
    },
    {
      "title": "Vulnerable/Marginalized Groups",
      "description":
          "Empowering and supporting communities facing discrimination or disadvantage to overcome barriers."
    },
    {
      "title": "Education",
      "description":
          "Ensuring access to quality education and developing skills that promote lifelong learning."
    },
    {
      "title": "Human Rights and Social Justice",
      "description":
          "Advocating for equality, human rights, and social justice for all communities."
    },
    {
      "title": "Peace and Conflict Resolution",
      "description":
          "Promoting strategies for resolving conflicts, fostering peace, and building social cohesion."
    },
    {
      "title": "Economic Empowerment",
      "description":
          "Promoting financial literacy, economic independence, and job creation within communities."
    },
    {
      "title": "Technology and Innovation",
      "description":
          "Leveraging technology and innovation to solve societal challenges and create new opportunities."
    },
    {
      "title": "Cultural Heritage and Identity",
      "description":
          "Preserving cultural traditions, promoting intercultural dialogue, and enhancing understanding between communities."
    },
    {
      "title": "Social Entrepreneurship",
      "description":
          "Developing businesses and social enterprises that address critical social issues and contribute to the public good."
    },
    {
      "title": "Migration and Refugee Issues",
      "description":
          "Supporting migration and refugee communities, ensuring integration, protection, and empowerment in their new environments."
    },
    {"title": "Other", "description": ""},
  ];

  @override
  void initState() {
    super.initState();
    // Initialize from provider
    final responses = ref.read(radioStringQuestionResponseProvider);
    _selectedValue = responses[widget.question];
  }

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _options.map((option) {
        final title = option["title"]!;
        final description = option["description"]!;

        return RadioListTile<String>(
          value: title,
          contentPadding: EdgeInsets.zero,
          groupValue: _selectedValue,
          dense: true,
          visualDensity: VisualDensity.compact,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            ref
                .read(radioStringQuestionResponseProvider.notifier)
                .updateResponse(widget.question, value!);
          },
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (states) => _selectedValue != null
                ? PhinexaColor.primaryLightBlue
                : PhinexaColor.primaryLightBlue.withOpacity(0.5),
          ),
          title: RichText(
            text: TextSpan(
              style: PhinexaFont.contentRegular,
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _selectedValue == title ? Colors.black : Colors.grey,
                  ),
                ),
                if (description.isNotEmpty)
                  TextSpan(
                    text: " – $description",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: _selectedValue == title
                          ? PhinexaColor.grey
                          : PhinexaColor.grey.withOpacity(0.6),
                    ),
                  ),
              ],
            ),
          ),
          activeColor: PhinexaColor.primaryLightBlue,
        );
      }).toList(),
    );
  }
}
