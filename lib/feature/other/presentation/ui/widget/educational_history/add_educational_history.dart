import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/presentation/ui/widget/educational_history/education_history_form.dart';
import '../../../../../../common/widget/custom_icon_button.dart';

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
    // ref.read(addButtonPressedProvider.notifier).state = true;
    // print('Save Changes from main');
  }

  @override
  Widget build(BuildContext context) {

    return FractionallySizedBox(
      heightFactor: 0.45,
      // resizeToAvoidBottomInset: true,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
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
                    label: 'Add',
                    textColour: Colors.white,
                    onPressed: () => saveChanges(),
                    color: Colors.blue,
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