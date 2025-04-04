import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../common/widget/custom_icon_button.dart';
import '../../../../../../common/widget/custom_text_field.dart';
import '../../../../../system_feedback/model/feedback.dart';
import '../../../../../system_feedback/provider/feedback_provider.dart';
import '../../../controller/skill/skill_controller.dart';

class ManageSkills extends ConsumerStatefulWidget {
  const ManageSkills({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ManageSkillsState();
}

class _ManageSkillsState extends ConsumerState<ManageSkills> {

  final TextEditingController searchSkillsController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchSkillsController.dispose();
    super.dispose();
  }

  void saveChanges() async {

    final unsavedSkills = ref.watch(skillControllerProvider).unsavedSkills;
    if (unsavedSkills.isEmpty) {
      final feedBackService = ref.read(feedbackServiceProvider);
      feedBackService.showToast("Oops! No new skills found to save", type: FeedbackType.info);
      return;
    }
    ref.read(skillControllerProvider.notifier).updateSkills();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    final isLoading = ref.watch(skillControllerProvider).isLoading;
    final isFailure = ref.watch(skillControllerProvider).isFailure;

    if(isFailure != null && isFailure){
      final feedBackService = ref.read(feedbackServiceProvider);
      final errorMessage = ref.watch(skillControllerProvider).errorMessage;
      // use system feedback to show the error message
      feedBackService.showToast(errorMessage?? "Error occurred", type: FeedbackType.error);
    }

    final skills = [
      ...ref.watch(skillControllerProvider).skills,
      ...ref.watch(skillControllerProvider).unsavedSkills,
    ];

    return FractionallySizedBox(
      heightFactor: skills.isEmpty? 0.4 : skills.length <=8? 0.24 + 0.06 * skills.length + 0.02 : 0.74,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Professional Skills',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(labelText: 'Skills', controller: searchSkillsController, height: 40,),
                      ),
                      const SizedBox(width: 16),
                      // container for use as a button
                      GestureDetector(
                        onTap: () {
                          if (searchSkillsController.text.isNotEmpty && !skills.any((skill) => skill.skill == searchSkillsController.text))
                            {
                              ref.read(skillControllerProvider.notifier).addSkill(searchSkillsController.text);
                              searchSkillsController.clear();
                            }
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: const Text(
                              'Add',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child:
                    skills.isEmpty
                        ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: const Center(child: Text('No skills added yet')),
                        )
                        :
                    ListView.builder(
                      itemCount: skills.length <= 8 ? skills.length : 8,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(skills[index].skill),
                          trailing: IconButton(
                            icon: Icon(Icons.delete_outline, color: (isLoading? Colors.grey : Colors.red)),
                            onPressed: isLoading? null :
                                () {
                                  ref.watch(skillControllerProvider.notifier).deleteSkill(skills[index].id);
                                },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomIconButton(
                  label: 'Cancel',
                  isBold: true,
                  textColour: Colors.black,
                  onPressed: () => Navigator.pop(context),
                  color: Colors.white,
                  borderColor: Color(0xFF3993A1),
                ),
                const SizedBox(width: 16),
                CustomIconButton(
                  label: 'Save Changes',
                  isBold: true,
                  textColour: Colors.white,
                  onPressed: saveChanges,
                  color: Color(0xFF3993A1),
                  iconColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}