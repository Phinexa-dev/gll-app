import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/certificate_widget.dart';

class CertificationTabScreen extends ConsumerStatefulWidget {
  const CertificationTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CertificationTabScreenState();
}

class _CertificationTabScreenState extends ConsumerState<CertificationTabScreen> {
  @override
  Widget build(BuildContext context) {

    final certificateList = [
      Certificate(
        title: "Strategic Leadership Program",
        organization: "Global Learning Lab",
        duration: "2020-2022",
        description:
        "Focused on developing decision-making, team management, and strategic thinking skills.",
      ),
      Certificate(
        title: "Advanced Data Analytics",
        organization: "Techno Vision Academy",
        duration: "2018-2020",
        description:
        "A program dedicated to enhancing data analysis, visualization, and business intelligence skills.",
      ),
      Certificate(
        title: "Digital Marketing Masterclass",
        organization: "Creative Minds Academy",
        duration: "2019-2021",
        description:
        "Specialized in digital marketing strategies, SEO, and online branding.",
      ),
      Certificate(
        title: "AI and Machine Learning Bootcamp",
        organization: "Innovative Tech Institute",
        duration: "2021-2023",
        description:
        "An immersive program focusing on AI model building, deep learning, and neural networks.",
      ),
    ];


    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          certificateList.length,
              (index) => Stack(
            children: [
              // Conditionally display the SVG background for every alternate widget
              if (index % 2 == 0)
                Positioned.fill(
                  top: 20,
                  child: SvgPicture.asset(
                    'assets/resources/certificate_bg.svg',
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CertificateWidget(
                  certificate: certificateList[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class Certificate {
  final String title;
  final String organization;
  final String duration;
  final String description;

  Certificate({
    required this.title,
    required this.organization,
    required this.duration,
    required this.description,
  });
}
