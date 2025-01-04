import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../common/theme/fonts.dart';
import '../widgets/resources_widget.dart';

class ResourcesTabScreen extends ConsumerStatefulWidget {
  const ResourcesTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResourcesTabScreenState();
}

class _ResourcesTabScreenState extends ConsumerState<ResourcesTabScreen> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24,),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/resources/leadership_academic.png',
                fit: BoxFit.cover,
                width: double.infinity,
      
              ),
            ),
            SizedBox(height: 8,),
            Text("Leadership Academy Workbook",style: PhinexaFont.highlightEmphasis,),
            SizedBox(height: 8,),
            _buildDownloadButton(context),
            ResourcesWidget(),
            SizedBox(height: 8,),
            ResourcesWidget(),
      
          ],
        ),
      ),
    );
  }
}

Widget _buildDownloadButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      print('Download button pressed');
    },
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: PhinexaColor.darkBlue,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    child: Text(
      'Download',
      style: PhinexaFont.contentAccent.copyWith(color: PhinexaColor.white),
    ),
  );
}

