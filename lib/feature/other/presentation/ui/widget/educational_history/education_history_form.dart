import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/feature/other/presentation/ui/provider/education_history_provider.dart';
import '../../../../../../common/theme/fonts.dart';
import '../../../../../../common/widget/custom_icon_button.dart';

class EducationHistoryForm extends ConsumerStatefulWidget {
  const EducationHistoryForm({
    super.key,
    this.id = '',
    this.school = '',
    this.degree = '',
    this.startDate = '',
    this.endDate = '',
  });

  final String id;
  final String school;
  final String degree;
  final String startDate;
  final String endDate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EducationHistoryFormState();
}

class _EducationHistoryFormState extends ConsumerState<EducationHistoryForm> {
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  void initState() {
    schoolController.text = widget.school;
    degreeController.text = widget.degree;
    startDateController.text = widget.startDate;
    endDateController.text = widget.endDate;
    super.initState();
  }

  @override
  void dispose() {
    schoolController.dispose();
    degreeController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  void saveChanges() {
    final history = ref.read(educationHistoryProvider);

    if(widget.id.isEmpty) {
      history.add({
        'id': DateTime.now().toString(),
        'school': schoolController.text,
        'degree': degreeController.text,
        'startDate': startDateController.text,
        'endDate': endDateController.text,
      });
      ref.read(educationHistoryProvider.notifier).state = history;
    } else {
      final updatedHistory = history.map((item) {
        if (item['id'] == widget.id) {
          return {
            'id': widget.id,
            'institution': schoolController.text,
            'degree': degreeController.text,
            'startDate': startDateController.text,
            'endDate': endDateController.text,
            'icon': "masters.svg", // masters.svg or bachelor.svg
          };
        }
        return item;
      }).toList();

      ref.read(educationHistoryProvider.notifier).state = updatedHistory;
    }
  }

  @override
  Widget build(BuildContext context) {

    final addButtonPressed = ref.read(addButtonPressedProvider);
    final editButtonPressed = ref.read(editButtonPressedProvider);

    if(addButtonPressed){
      saveChanges();
      ref.read(addButtonPressedProvider.notifier).state = false;
    }
    if(editButtonPressed){
      saveChanges();
      ref.read(editButtonPressedProvider.notifier).state = false;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        CustomTextField(labelText: 'School', controller: schoolController, keyboardType: TextInputType.text),
        const SizedBox(height: 16),
        CustomTextField(labelText: 'Degree', controller: degreeController, keyboardType: TextInputType.text),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: CustomTextField(labelText: 'Start Date', controller: startDateController, keyboardType: TextInputType.text)
            ),
            const SizedBox(width: 16),
            Expanded(
                child: CustomTextField(labelText: 'End Date(or expected)', controller: endDateController, keyboardType: TextInputType.text)
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}