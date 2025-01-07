import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/feature/resources/presentation/ui/widgets/sip_report_post_widget.dart';

import '../../../../../common/theme/colors.dart';

class SipReportViewMore extends ConsumerWidget {

  final SipReport report;
  const SipReportViewMore({super.key,required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: report.postTitle,
                      style: PhinexaFont.headingLarge
                  ),
                ),
              Text(
                report.postLocation,
                style: PhinexaFont.contentRegular,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(report.userAvatarUrl),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          report.userName,
                          style: PhinexaFont.highlightAccent,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          report.timestamp,
                          style: PhinexaFont.captionRegular.copyWith(color: PhinexaColor.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24,),
              if (report.imageUrl != null && report.imageUrl!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    report.imageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100),
                  ),
                )
              else
                SizedBox.shrink(),
              SizedBox(height: 24,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Impact - ',
                      style: PhinexaFont.contentAccent,
                    ),
                    TextSpan(
                      text: report.impactText,
                      style: PhinexaFont.contentRegular,
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 12,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: report.description,
                      style: PhinexaFont.contentRegular,
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}
