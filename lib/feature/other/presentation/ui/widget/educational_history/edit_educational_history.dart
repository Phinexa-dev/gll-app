import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/feature/other/presentation/ui/widget/educational_history/education_history_form.dart';
import '../../../../../../common/widget/custom_icon_button.dart';
import '../../provider/education_history_provider.dart';

class EditEducationalHistory extends ConsumerStatefulWidget {
  const EditEducationalHistory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditEducationalHistoryState();
}

class _EditEducationalHistoryState extends ConsumerState<EditEducationalHistory> {

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

    final history = ref.watch(educationHistoryProvider);

    return FractionallySizedBox(
      heightFactor: 0.1 + 2 * 0.32,
      // resizeToAvoidBottomInset: true,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
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
                      // EducationHistoryForm(),
                      // list of education history form in the length of history and with a divider
                      for (var i = 0; i < history.length; i++)
                        Column(
                          children: [
                            EducationHistoryForm(
                              id: history[i]['id']!,
                              school: history[i]['institution']!,
                              degree: history[i]['degree']!,
                              startDate: history[i]['startDate']!,
                              endDate: history[i]['endDate']!,
                            ),
                            if (i != history.length - 1) const Divider(),
                          ],
                        ),
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
                    label: 'Save Changes',
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