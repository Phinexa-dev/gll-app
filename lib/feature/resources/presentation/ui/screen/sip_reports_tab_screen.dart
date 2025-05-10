import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../controller/sip_report/sip_report_controller.dart';
import '../provider/search_provider.dart';
import '../widgets/shimmer_post_widget.dart';
import '../widgets/sip_report_post_widget.dart';

class SipReportsTabScreen extends ConsumerStatefulWidget {
  const SipReportsTabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SipReportsTabScreenState();
}

class _SipReportsTabScreenState extends ConsumerState<SipReportsTabScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch reports when screen initializes
    Future.microtask(() {
      ref.read(sipReportControllerProvider.notifier).getSipReportsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchQueryProvider).toLowerCase();
    final sipState = ref.watch(sipReportControllerProvider);

    // Handle loading state
    if (sipState.isLoading) {
      return ListView.separated(
        itemCount: 5, // Number of shimmer items
        padding: const EdgeInsets.symmetric(vertical: 16),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) => const ShimmerPostWidget(),
      );
    }

    // Handle error state
    if (sipState.isFailure == true) {
      return Center(
        child: Text('Error: ${sipState.errorMessage}'),
      );
    }

    // Get filtered reports
    final filteredReports = sipState.sipReportsData.where((report) {
      return report.title.toLowerCase().contains(searchQuery);
    }).toList();

    // Handle empty state
    if (filteredReports.isEmpty) {
      return const Center(
        child: Text('No SIP reports found'),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < filteredReports.length; i++)
            Stack(
              children: [
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
                  child: SipReportPostWidget(report: filteredReports[i]),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
