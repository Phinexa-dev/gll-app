import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/presentation/ui/widget/educational_history/education_history_form.dart';
import '../../../../../../common/widget/custom_icon_button.dart';
import '../../provider/education_history_provider.dart';

class AddEducationalHistory extends ConsumerStatefulWidget {
  const AddEducationalHistory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEducationalHistoryState();
}

class _AddEducationalHistoryState extends ConsumerState<AddEducationalHistory> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void saveChanges() {
    ref.read(addButtonPressedProvider.notifier).state = true;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Education History',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    EducationHistoryForm(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomIconButton(
                    label: 'Cancel',
                    isBold: true,
                    textColour: Color(0xFF3993A1),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.white,
                    borderColor: Color(0xFF3993A1),
                  ),
                  const SizedBox(width: 16),
                  CustomIconButton(
                    label: 'Add',
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