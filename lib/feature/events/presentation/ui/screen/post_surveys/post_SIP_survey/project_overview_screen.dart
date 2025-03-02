import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../../core/route/route_name.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../widgets/custom_selection_radio_button_widget.dart';

class SIPProjectOverviewScreen extends ConsumerStatefulWidget {
  const SIPProjectOverviewScreen({super.key});

  @override
  _SIPProjectOverviewScreenState createState() =>
      _SIPProjectOverviewScreenState();
}

class _SIPProjectOverviewScreenState
    extends ConsumerState<SIPProjectOverviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Flexible(
          child: Text(
            'Post Survey - SIP',
            style: PhinexaFont.highlightAccent,
            maxLines: 2, // Allow text to break into two lines
            overflow: TextOverflow.ellipsis, // Show '...' if text overflows
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Thank you for completing your Sustainable Impact Project (SIP). Your feedback  will help us understand the impact of your project and improve future programs.  This survey is voluntary, and all responses will remain anonymous.',
                style: PhinexaFont.highlightRegular,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Project Overview",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "What was the focus of your Sustainable Impact Project",
                style: PhinexaFont.contentRegular,
              ),
              CustomSelectionRadioButtonWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: CustomFormTextField(
                  hintText: 'SIP',
                  obscureText: false,
                  height: 140,
                  maxLines: 10,
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText:
                    "Briefly describe the main activities or strategies you implemented in your  project",
                hintText: 'We did ...',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText:
                    "What were the key outcomes or impacts of your project?",
                hintText: 'We did ...',
                obscureText: false,
                height: 110,
                maxLines: 10,
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 10,
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
                      onPressed: () {
                        context.pushNamed(RouteName.sipSkillsApplicationScreen);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
