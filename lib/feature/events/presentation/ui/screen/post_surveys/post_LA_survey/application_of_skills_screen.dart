import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class LAApplicationOfSkillsScreen extends ConsumerStatefulWidget {
  const LAApplicationOfSkillsScreen({super.key});

  @override
  _LAApplicationOfSkillsScreenState createState() =>
      _LAApplicationOfSkillsScreenState();
}

class _LAApplicationOfSkillsScreenState
    extends ConsumerState<LAApplicationOfSkillsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Post Leadership Academy Survey',
            style: PhinexaFont.highlightAccent),
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
                "Application of Skills",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              CustomRadioQuestion(
                question:
                    "I can apply the skills gained during the Leadership Academy in my community",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioQuestion(
                question:
                    "I can use the skills from the program in my future work",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioQuestion(
                question:
                    "I am interested in contributing to community resilience and sustainability projects",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioQuestion(
                question:
                    "I am interested in learning how to train others using this program",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                labelText:
                    "Do you have any suggestions to improve the Leadership Academy for future participants?",
                hintText: 'I like ...',
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  label: "Submit",
                  height: 40,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
