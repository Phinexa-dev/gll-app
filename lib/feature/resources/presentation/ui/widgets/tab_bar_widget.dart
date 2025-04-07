import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/feature/resources/presentation/ui/screen/badges_tab_screen.dart';
import 'package:gll/feature/resources/presentation/ui/screen/certification_tab_screen.dart';
import 'package:gll/feature/resources/presentation/ui/screen/sip_reports_tab_screen.dart';

import '../../../../../common/theme/fonts.dart';
import '../provider/resources_tab_control_provider.dart';

class TabBarWidget extends ConsumerWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TabBar(
            onTap: (index) {
              ref
                  .read(tabIndexProvider.notifier)
                  .state = index;
            },
            labelStyle: PhinexaFont.contentRegular,
            dividerColor: PhinexaColor.grey,
            labelPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: PhinexaColor.primaryColor,
            labelColor: PhinexaColor.primaryColor,
            tabs: const [
              Tab(text: "SIP Reports"),
              Tab(text: "Badges"),
              Tab(text: "Certifications"),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              SipReportsTabScreen(),
              BadgesTabScreen(),
              CertificationTabScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
