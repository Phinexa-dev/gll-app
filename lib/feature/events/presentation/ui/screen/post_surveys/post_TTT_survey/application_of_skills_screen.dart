import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';

import '../../../../../../../../common/widget/custom_button.dart';
import '../../../../../../../common/widget/custom_form_text_field.dart';
import '../../../widgets/custom_radio_button_widget.dart';

class TTTApplicationOfSkillsScreen extends ConsumerStatefulWidget {
  const TTTApplicationOfSkillsScreen({super.key});

  @override
  _TTTApplicationOfSkillsScreenState createState() =>
      _TTTApplicationOfSkillsScreenState();
}

class _TTTApplicationOfSkillsScreenState
    extends ConsumerState<TTTApplicationOfSkillsScreen> {
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
            'Post-Leadership Academy Train the Trainer Survey',
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
                "Application of Skills",
                style: PhinexaFont.headingLarge,
              ),
              SizedBox(
                height: 20,
              ),
              CustomRadioQuestion(
                question:
                    "I feel confident in my ability to facilitate the Leadership Academy modules",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioQuestion(
                question:
                    "I can effectively use the facilitation skills gained during the workshop",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioQuestion(
                question:
                    "I am prepared to deliver the Sustainable Impact Plan module",
                onChanged: (bool? value) {
                  print("Selected: $value");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioQuestion(
                question:
                    "I am interested in facilitating future Leadership Academy workshops",
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
