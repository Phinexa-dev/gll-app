import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';

class PreSurvayScreen extends ConsumerStatefulWidget {
  const PreSurvayScreen({super.key});

  @override
  _PreSurvayScreenState createState() => _PreSurvayScreenState();
}

class _PreSurvayScreenState extends ConsumerState<PreSurvayScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pre Survey', style: PhinexaFont.headingSmall),
      ),
      body: Center(
        child: Text("Pre Survey",style: PhinexaFont.headingExLarge,),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: CustomButton(
          label: "Register",
          height: 40,
          onPressed: () => {},
        ),
      ),
    );
  }
}



