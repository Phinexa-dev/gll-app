import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/feature/other/presentation/controller/education/education_controller.dart';
import 'package:gll/feature/other/presentation/ui/provider/education_history_provider.dart';
import 'package:intl/intl.dart';
import '../../../../../system_feedback/model/feedback.dart';
import '../../../../../system_feedback/provider/feedback_provider.dart';

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

  void editEducation() {
    ref.read(editButtonPressedProvider.notifier).state = false;

    // check if the form is valid
    if (schoolController.text.isEmpty || degreeController.text.isEmpty || startDateController.text.isEmpty || endDateController.text.isEmpty) {
      ref.read(feedbackServiceProvider).showToast("Please fill all fields", type: FeedbackType.error);
      return;
    }

    // check if the start date is before the end date
    final startDate = DateFormat('yyyy-MM-dd').parse(startDateController.text);
    final endDate = DateFormat('yyyy-MM-dd').parse(endDateController.text);
    if (startDate.isAfter(endDate)) {
      ref.read(feedbackServiceProvider).showToast("Start date must be before end date", type: FeedbackType.error);
      return;
    }

    final formData = {
      'school': schoolController.text,
      'degree': degreeController.text,
      'startDate': startDateController.text,
      'endDate': endDateController.text,
    };

    // set the form data to the controller
    ref.read(educationControllerProvider.notifier).setFormData(formData);
    ref.read(educationControllerProvider.notifier).editEducationData(int.parse(widget.id));
    Navigator.pop(context);
  }

  void addEducation() {
    ref.read(addButtonPressedProvider.notifier).state = false;

    // check if the form is valid
    if (schoolController.text.isEmpty || degreeController.text.isEmpty || startDateController.text.isEmpty || endDateController.text.isEmpty) {
      ref.read(feedbackServiceProvider).showToast("Please fill all fields", type: FeedbackType.error);
      return;
    }

    // check if the start date is before the end date
    final startDate = DateFormat('yyyy-MM-dd').parse(startDateController.text);
    final endDate = DateFormat('yyyy-MM-dd').parse(endDateController.text);
    if (startDate.isAfter(endDate)) {
      ref.read(feedbackServiceProvider).showToast("Start date must be before end date", type: FeedbackType.error);
      return;
    }

    final formData = {
      'school': schoolController.text,
      'degree': degreeController.text,
      'startDate': startDateController.text,
      'endDate': endDateController.text,
    };

    // set the form data to the controller
    ref.read(educationControllerProvider.notifier).setFormData(formData);
    ref.read(educationControllerProvider.notifier).addEducationData();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    final addButtonPressed = ref.watch(addButtonPressedProvider);
    final editButtonPressed = ref.watch(editButtonPressedProvider);
    final educationState = ref.watch(educationControllerProvider);

    if(addButtonPressed){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        addEducation();
      });
    }
    if(editButtonPressed){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        editEducation();
      });
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
              child: GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 130),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    startDateController.text = formattedDate;
                  }
                },
                child: AbsorbPointer( // Prevents manual text input
                  child: CustomTextField(
                    labelText: 'Start Date',
                    controller: startDateController,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 130),
                    lastDate: DateTime(DateTime.now().year + 130),
                  );
                  if (pickedDate != null) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    endDateController.text = formattedDate; // Update controller
                    // Optionally store in formData directly: formData['endDate'] = formattedDate;
                  }
                },
                child: AbsorbPointer(
                  child: CustomTextField(
                    labelText: 'End Date (or expected)',
                    controller: endDateController,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}