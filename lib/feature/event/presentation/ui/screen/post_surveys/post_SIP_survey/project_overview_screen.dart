import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/theme/colors.dart';
import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../provider/multi_select_response_provider.dart';
import '../../../provider/text_and_dropdown_reponses_provider.dart';
import '../../../widgets/custom_selection_radio_button_widget.dart';

class SIPProjectOverviewScreen extends ConsumerStatefulWidget {
  const SIPProjectOverviewScreen({super.key});

  @override
  _SIPProjectOverviewScreenState createState() =>
      _SIPProjectOverviewScreenState();
}

class _SIPProjectOverviewScreenState
    extends ConsumerState<SIPProjectOverviewScreen> {
  late TextEditingController otherController;
  late TextEditingController activitiesController;
  late TextEditingController outcomesController;

  final _topicsError = ValueNotifier<String?>(null);
  final _otherError = ValueNotifier<String?>(null);
  final _activitiesError = ValueNotifier<String?>(null);
  final _outcomesError = ValueNotifier<String?>(null);

  final String _sipFocusQuestion =
      "What was the focus of your Sustainable Impact Project?";

  final List<Map<String, String>> _sipOptions = const [
    {
      "title": "Environment/Climate",
      "description":
      "Promoting environmental sustainability, conservation, and responsible resource management.",
    },
    {
      "title": "Health",
      "description":
      "Supporting physical and mental health initiatives, access to healthcare, and overall well-being.",
    },
    {
      "title": "Vulnerable/Marginalized Groups",
      "description":
      "Empowering and supporting communities facing discrimination or disadvantage to overcome barriers.",
    },
    {
      "title": "Education",
      "description":
      "Ensuring access to quality education and developing skills that promote lifelong learning.",
    },
    {
      "title": "Human Rights and Social Justice",
      "description":
      "Advocating for equality, human rights, and social justice for all communities.",
    },
    {
      "title": "Peace and Conflict Resolution",
      "description":
      "Promoting strategies for resolving conflicts, fostering peace, and building social cohesion.",
    },
    {
      "title": "Economic Empowerment",
      "description":
      "Promoting financial literacy, economic independence, and job creation within communities.",
    },
    {
      "title": "Technology and Innovation",
      "description":
      "Leveraging technology and innovation to solve societal challenges and create new opportunities.",
    },
    {
      "title": "Cultural Heritage and Identity",
      "description":
      "Preserving cultural traditions, promoting intercultural dialogue, and enhancing understanding between communities.",
    },
    {
      "title": "Social Entrepreneurship",
      "description":
      "Developing businesses and social enterprises that address critical social issues and contribute to the public good.",
    },
    {
      "title": "Migration and Refugee Issues",
      "description":
      "Supporting migration and refugee communities, ensuring integration, protection, and empowerment in their new environments.",
    },
    {"title": "Other", "description": ""},
  ];

  @override
  void initState() {
    super.initState();
    final textResponses = ref.read(surveyTextFieldResponseProvider);

    otherController = TextEditingController(
      text: textResponses["SIP Focus - Other"] ?? '',
    );
    activitiesController = TextEditingController(
      text: textResponses["Main activities or strategies implemented"] ?? '',
    );
    outcomesController = TextEditingController(
      text: textResponses["Key outcomes or impacts"] ?? '',
    );
  }

  @override
  void dispose() {
    otherController.dispose();
    activitiesController.dispose();
    outcomesController.dispose();
    _topicsError.dispose();
    _otherError.dispose();
    _activitiesError.dispose();
    _outcomesError.dispose();
    super.dispose();
  }

  void _showTopSnackBar(BuildContext context, String message) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: 20.0,
        right: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Text(message, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: 3)).then((value) {
      overlayEntry.remove();
    });
  }

  void _validateForm() {
    bool isValid = true;
    String errorMessage = "The following fields are required:\n";

    final multiSelectResponses = ref.read(surveyMultiSelectResponseProvider);
    final textResponses = ref.read(surveyTextFieldResponseProvider);

    final selectedFocusList = multiSelectResponses[_sipFocusQuestion] as List?;

    if (selectedFocusList == null || selectedFocusList.isEmpty) {
      _topicsError.value = 'Please select at least one focus area';
      isValid = false;
      errorMessage += "- Project focus area\n";
    } else {
      _topicsError.value = null;
      if (selectedFocusList.contains("Other") &&
          (otherController.text.trim().isEmpty)) {
        _otherError.value = 'Please specify your focus area';
        isValid = false;
        errorMessage += "- Other project focus\n";
      } else {
        _otherError.value = null;
      }
    }

    if (textResponses["Briefly describe the main activities or strategies you implemented in your  project"]
        ?.isEmpty ??
        true) {
      _activitiesError.value = 'Please describe the main activities';
      isValid = false;
      errorMessage += "- Main activities\n";
    } else {
      _activitiesError.value = null;
    }

    if (textResponses["What were the key outcomes or impacts of your project"]
        ?.isEmpty ??
        true) {
      _outcomesError.value = 'Please describe the key outcomes';
      isValid = false;
      errorMessage += "- Key outcomes or impacts\n";
    } else {
      _outcomesError.value = null;
    }

    if (isValid) {
      context.pushNamed(RouteName.sipSkillsApplicationScreen);
    } else {
      _showTopSnackBar(context, errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedFocusList =
    ref.watch(surveyMultiSelectResponseProvider)[_sipFocusQuestion]
    as List?;
    final bool showOtherTextField =
        selectedFocusList?.contains("Other") ?? false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Post Survey - SIP',
          style: PhinexaFont.highlightAccent,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'By uploading your SIP report, photos, and any links, you\'re not just finishing a project you’re sharing your story of leadership, creativity, and impact. And here\'s the cool part: everything you upload will stay in the app. You can come back to it anytime, share it with others, and even use it for future opportunities like scholarships, jobs, or starting your own next big thing.',
                  style: PhinexaFont.highlightRegular,
                ),
                const SizedBox(height: 10),
                Text(
                  'We are so proud of you. You’ve brought your DAC mindset, your vision, and your growth game to life and now the world gets to see what you\'ve done.',
                  style: PhinexaFont.highlightRegular,
                ),
                const SizedBox(height: 10),
                Text(
                  'Let’s finish strong',
                  style: PhinexaFont.highlightRegular,
                ),
                const SizedBox(height: 20),
                Text("Project Overview", style: PhinexaFont.headingLarge),
                const SizedBox(height: 20),
                ValueListenableBuilder<String?>(
                  valueListenable: _topicsError,
                  builder: (context, error, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichTextMultiSelectCheckbox(
                          question: _sipFocusQuestion,
                          options: _sipOptions,
                        ),
                        if (error != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              error,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                if (showOtherTextField)
                  ValueListenableBuilder<String?>(
                    valueListenable: _otherError,
                    builder: (context, error, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: CustomFormTextField(
                              controller: otherController,
                              labelText: 'Other Project Focus',
                              hintText: 'Please explain',
                              obscureText: false,
                              height: 140,
                              maxLines: 10,
                              onChanged: (value) {
                                ref
                                    .read(
                                  surveyTextFieldResponseProvider.notifier,
                                )
                                    .updateResponse("SIP Focus - Other", value);
                              },
                            ),
                          ),
                          if (error != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 4),
                              child: Text(
                                error,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ValueListenableBuilder<String?>(
                  valueListenable: _activitiesError,
                  builder: (context, error, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormTextField(
                          controller: activitiesController,
                          labelText:
                          "Briefly describe the main activities or strategies you implemented in your  project",
                          hintText: '',
                          obscureText: false,
                          height: 110,
                          maxLines: 10,
                          onChanged: (value) {
                            ref
                                .read(surveyTextFieldResponseProvider.notifier)
                                .updateResponse(
                              "Briefly describe the main activities or strategies you implemented in your  project",
                              value,
                            );
                          },
                        ),
                        if (error != null)
                          Text(error, style: TextStyle(color: Colors.red)),
                      ],
                    );
                  },
                ),
                ValueListenableBuilder<String?>(
                  valueListenable: _outcomesError,
                  builder: (context, error, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormTextField(
                          controller: outcomesController,
                          labelText:
                          "What were the key outcomes or impacts of your project",
                          hintText: '',
                          obscureText: false,
                          height: 110,
                          maxLines: 10,
                          onChanged: (value) {
                            ref
                                .read(surveyTextFieldResponseProvider.notifier)
                                .updateResponse(
                              "What were the key outcomes or impacts of your project",
                              value,
                            );
                          },
                        ),
                        if (error != null)
                          Text(error, style: TextStyle(color: Colors.red)),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: CustomButton(
                        width: 100,
                        label: "Next",
                        icon: Icons.chevron_right_rounded,
                        height: 40,
                        onPressed: _validateForm,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}