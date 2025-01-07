import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/sip_report_post_widget.dart';

class SipReportsTabScreen extends ConsumerStatefulWidget {
  const SipReportsTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SipReportsTabScreenState();
}

List<SipReport> reports = [
  SipReport(
    userName: "Alice Johnson",
    userAvatarUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
    timestamp: '1 hour ago',
    postTitle: "Tree Planting Campaign",
    postLocation: "California, USA",
    impactText: '1,500+ trees planted',
    description: 'We planted over 1,500 trees in the forest area, contributing to the environment and wildlife restoration. We planted over 1,500 trees in the forest area, contributing to the environment and wildlife restoration. We planted over 1,500 trees in the forest area, contributing to the environment and wildlife restoration. We planted over 1,500 trees in the forest area, contributing to the environment and wildlife restoration.',
    likeCount: 25,
    commentCount: 12,
    shareCount: 7,
    isLiked : true,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
  ),
  SipReport(
    userName: "John Smith",
    userAvatarUrl: 'https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg',
    timestamp: '3 hours ago',
    postTitle: "Beach Cleanup",
    postLocation: "Sydney, Australia",
    impactText: '300 kg of waste collected',
    description: 'Our volunteers cleaned the beach, removing plastic and other waste, ensuring a cleaner environment for the community.',
    likeCount: 42,
    commentCount: 19,
    shareCount: 5,
    isLiked : false,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
  ),
  SipReport(
    userName: "Samantha Green",
    userAvatarUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
    timestamp: '5 hours ago',
    postTitle: "Water Conservation Initiative",
    postLocation: "New York, USA",
    impactText: '500 homes reduced water usage',
    description: 'Our team helped local households reduce their water usage by 20%, contributing to sustainable living.',
    likeCount: 38,
    commentCount: 22,
    shareCount: 11,
    isLiked : false,
    imageUrl: null,
  ),
  SipReport(
    userName: "David Brown",
    userAvatarUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
    timestamp: '6 hours ago',
    postTitle: "Solar Panel Installation Program",
    postLocation: "Berlin, Germany",
    impactText: '100+ homes powered by solar energy',
    description: 'We installed solar panels for over 100 homes, helping families reduce their carbon footprint and energy bills.',
    likeCount: 31,
    commentCount: 8,
    shareCount: 9,
    isLiked : true,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
  ),
  SipReport(
    userName: "Michael Carter",
    userAvatarUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
    timestamp: '8 hours ago',
    postTitle: "Food Drive for Homeless",
    postLocation: "London, UK",
    impactText: '500 meals distributed',
    description: 'Our team collected food donations and distributed over 500 meals to homeless individuals across the city.',
    likeCount: 53,
    commentCount: 17,
    shareCount: 15,
    isLiked : true,
    imageUrl: null
  ),
  SipReport(
    userName: "Sophia Turner",
    userAvatarUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg?20200418092106',
    timestamp: '10 hours ago',
    postTitle: "Charity Run for Cancer Research",
    postLocation: "Toronto, Canada",
    impactText: 'Raised 10,000 for cancer research',
    description: 'We organized a charity run event that raised funds for cancer research, bringing the community together for a good cause.',
    likeCount: 45,
    commentCount: 30,
    shareCount: 20,
    isLiked : true,
    imageUrl: null
  ),
];



class _SipReportsTabScreenState extends ConsumerState<SipReportsTabScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < reports.length; i++)
            Stack(
              children: [
                // Conditionally display the SVG background
                if (i % 2 == 0)
                  Positioned.fill(
                    bottom: 10,
                    child: SvgPicture.asset(
                      'assets/resources/resources_bg.svg',
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SipReportPostWidget(report: reports[i]),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
