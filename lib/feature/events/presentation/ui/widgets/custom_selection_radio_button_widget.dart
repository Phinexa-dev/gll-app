import 'package:flutter/material.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

class CustomSelectionRadioButtonWidget extends StatefulWidget {
  @override
  _CustomSelectionRadioButtonWidgetState createState() =>
      _CustomSelectionRadioButtonWidgetState();
}

class _CustomSelectionRadioButtonWidgetState
    extends State<CustomSelectionRadioButtonWidget> {
  String? selectedOption;

  final List<Map<String, String>> options = [
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
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        return RadioListTile<String>(
          value: option["title"]!,
          contentPadding: EdgeInsets.zero,
          groupValue: selectedOption,
          dense: true,
          visualDensity: VisualDensity.compact,
          onChanged: (value) {
            setState(() {
              selectedOption = value;
            });
          },
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (states) => selectedOption != null
                ? PhinexaColor.primaryLightBlue
                : PhinexaColor.primaryLightBlue.withOpacity(0.5),
          ),
          title: RichText(
            text: TextSpan(
              style: PhinexaFont.contentRegular,
              children: [
                TextSpan(
                  text: option["title"]!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: PhinexaColor.black),
                ),
                if (option["description"]!.isNotEmpty)
                  TextSpan(
                    text: " – ${option["description"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: PhinexaColor.grey),
                  ),
              ],
            ),
          ),
          activeColor: Colors.blue,
        );
      }).toList(),
    );
  }
}
