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

  final List<Resource> resources = [
    Resource(
      title: 'Sustainable Development Goals in Action',
      date: DateTime.now(),
      description: 'Sustainable Development Goals in Action refers to practical, impactful initiatives and strategies aimed at achieving the 17 Sustainable Development Goals (SDGs) outlined by the United Nations. These goals address global challenges such as poverty, inequality, climate change, environmental degradation, peace, and justice. The concept emphasizes real-world actions, collaborations, and innovations that contribute to sustainable development at local, national, and global levels.',
      imagePath: 'assets/resources/leadership_academic.png',
    ),
    Resource(
      title: 'Climate Action for Change',
      date: DateTime.now(),
      description: 'Learn about sustainable practices to combat climate change.',
      imagePath: 'assets/resources/leadership_academic.png',
    ),
    Resource(
      title: 'Innovation in Education',
      date: DateTime.now(),
      description: 'Explore innovative approaches to enhance learning experiences.',
      imagePath: 'assets/resources/leadership_academic.png',
    ),
  ];


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
            ...resources.map((resource) {
              return ResourcesWidget(resource: resource);
            }).toList(),
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

class Resource {
  final String title;
  final DateTime date;
  final String description;
  final String imagePath;

  Resource({
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
  });
}


