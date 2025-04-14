import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/route/route_name.dart';
import '../../../domain/model/sip_report/sip_report_model.dart';

class SipReportPostWidget extends ConsumerWidget {
  final SipReportModel report;

  const SipReportPostWidget({super.key, required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _buildPostDetails(),
          const SizedBox(height: 8),
          _buildPdfPreview(),
          const SizedBox(height: 8),
          _buildPostDescription(),
          const SizedBox(height: 16),
          _buildViewReportButton(context),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildPostDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          report.title,
          style: PhinexaFont.highlightEmphasis,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }

  Widget _buildPdfPreview() {
    return GestureDetector(
      onTap: () => _launchPdfUrl(report.image),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: PhinexaColor.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(Icons.picture_as_pdf, color: PhinexaColor.primaryLightBlue),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SIP Report PDF',
                    style: PhinexaFont.contentAccent,
                  ),
                  Text(
                    _getFileNameFromUrl(report.image),
                    style: PhinexaFont.captionRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.open_in_new, color: PhinexaColor.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildPostDescription() {
    return Text(
      report.description,
      style: PhinexaFont.contentRegular,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildViewReportButton(BuildContext context) {
    return CustomButton(
      label: "View Report",
      onPressed: () {
        context.pushNamed(
          RouteName.reportMore,
          extra: report,
        );
      },
      height: 30,
    );
  }

  String _getFileNameFromUrl(String url) {
    try {
      return Uri.parse(url).pathSegments.last;
    } catch (e) {
      return 'report.pdf';
    }
  }

  Future<void> _launchPdfUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
