import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../common/widget/custom_icon_button.dart';
import '../../../../../../common/widget/custom_text_field.dart';

final mockSkillsProvider = StateProvider<List<String>>((ref) =>
  [
    'Strategic Leadership',
    'Agile Project Management',
    'Stakeholder Communication',
    'Data Driven Decision Making',
    'Change Management',
  ]
);

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

  void saveChanges() {
    final updatedValues = {
    };

    print(updatedValues);
  }

  @override
  Widget build(BuildContext context) {

    final skills = ref.watch(mockSkillsProvider);

    return FractionallySizedBox(
      heightFactor: skills.length <=8? 0.24 + 0.06 * skills.length + 0.02 : 0.74,
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
                          if (searchSkillsController.text.isNotEmpty && !skills.contains(searchSkillsController.text))
                            {
                              ref.read(mockSkillsProvider.notifier).state = List.from(skills)..add(searchSkillsController.text);
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
                    child: ListView.builder(
                      itemCount: skills.length <= 8 ? skills.length : 8,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(skills[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              ref.read(mockSkillsProvider.notifier).state = List.from(skills)..removeAt(index);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIconButton(
                        label: 'Cancel',
                        textColour: Colors.black,
                        onPressed: () => Navigator.pop(context),
                        color: Colors.white,
                        borderColor: Colors.blue,
                      ),
                      const SizedBox(width: 16),
                      CustomIconButton(
                        label: 'Save Changes',
                        textColour: Colors.white,
                        onPressed: () => saveChanges,
                        color: Colors.blue,
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}