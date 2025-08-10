import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends ConsumerStatefulWidget {
  const AboutUs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutUsState();
}

class _AboutUsState extends ConsumerState<AboutUs> {
  final List<String> _locationBgSvgs = [
    'assets/more/camp_detail_bg_1.svg',
    'assets/more/camp_detail_bg_2.svg',
    'assets/more/camp_bg_4.svg',
  ];
  final Random _rand = Random();

  final Map<String, String> _socialLinks = {
    'linkedin': 'https://www.linkedin.com/company/global-learning-lab/',
    'instagram': 'https://www.instagram.com/global.learning.lab?igsh=a3Y2dmJjb2s4YnVk',
    'facebook': 'https://www.facebook.com/share/19NQqnFn9c/?mibextid=wwXIfr',
    'website': 'https://www.globallearninglab.org/',
  };

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("About Us"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset('assets/more/about_us_bg.svg', fit: BoxFit.cover),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Global Learning Lab International (GL2i) is a global community of young leaders, mentors, and changemakers.',
                    style: PhinexaFont.labelRegular.copyWith(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We believe in the power of youth to lead positive change—starting in their own communities.',
                    style: PhinexaFont.labelRegular.copyWith(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'What We Do:',
                    style: PhinexaFont.labelRegular.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  _bullet('Discover their voice and purpose'),
                  _bullet('Build the skills to lead with others'),
                  _bullet('Launch Sustainable Impact Projects (SIPs) that make real change happen'),
                  const SizedBox(height: 12),
                  Text(
                    'We’re here to support you—not just during the training, but throughout your leadership journey. Whether you\'re a student, a mentor, or a future trainer, you\'re now part of a global movement rooted in courage, collaboration, and community.',
                    style: PhinexaFont.labelRegular.copyWith(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Why It Matters:',
                    style: PhinexaFont.labelRegular.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'We know the world needs fresh ideas, fierce kindness, and bold leadership. That’s where you come in.',
                    style: PhinexaFont.labelRegular.copyWith(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Where We Work:',
                    style: PhinexaFont.labelRegular.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'GL2i programs have been led in 7+ countries (and counting!)—from rural villages to capital cities. Every SIP, every voice, every leader matters.',
                    style: PhinexaFont.labelRegular.copyWith(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Stay Connected:',
                    style: PhinexaFont.labelRegular.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Want to learn more or get involved?\nTap the FAQs, check out the SIP Map, or connect with us on Instagram, Facebook, LinkedIn and YouTube. Let’s keep growing together.',
                    style: PhinexaFont.labelRegular.copyWith(fontSize: 13),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.globe,
                    label: 'Website',
                    color: Colors.blueGrey,
                    onTap: () => _launchUrl(_socialLinks['website']!),
                  ),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.facebook,
                    label: 'Facebook',
                    color: const Color(0xFF1877F2),
                    onTap: () => _launchUrl(_socialLinks['facebook']!),
                  ),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.linkedinIn,
                    label: 'LinkedIn',
                    color: const Color(0xFF0077B5),
                    onTap: () => _launchUrl(_socialLinks['linkedin']!),
                  ),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.instagram,
                    label: 'Instagram',
                    color: const Color(0xFFE4405F),
                    onTap: () => _launchUrl(_socialLinks['instagram']!),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.1),
            child: FaIcon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: PhinexaFont.labelRegular.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style:
          PhinexaFont.headingESmall.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        text,
        style: PhinexaFont.labelRegular.copyWith(fontSize: 13),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildLocationSection(
      String location, Map<String, List<String>> testimonialsByPerson) {
    final bgAsset = _locationBgSvgs[_rand.nextInt(_locationBgSvgs.length)];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(bgAsset, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: PhinexaFont.headingSmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                for (var entry in testimonialsByPerson.entries) ...[
                  Text(
                    entry.key,
                    style: PhinexaFont.labelRegular.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  for (var quote in entry.value) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(fontSize: 13)),
                        Expanded(
                          child: Text(
                            quote,
                            style:
                            PhinexaFont.labelRegular.copyWith(fontSize: 13),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                  const SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 13)),
          Expanded(
            child: Text(
              text,
              style: PhinexaFont.labelRegular.copyWith(fontSize: 13),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}