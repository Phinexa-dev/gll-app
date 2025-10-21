import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import '../../../../../common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../core/route/route_name.dart';
import '../../../domain/model/sip_report/sip_report_model.dart';

class SipReportPostWidget extends ConsumerStatefulWidget {
  final SipReportModel report;

  const SipReportPostWidget({super.key, required this.report});

  @override
  ConsumerState<SipReportPostWidget> createState() => _SipReportPostWidgetState();
}

class _SipReportPostWidgetState extends ConsumerState<SipReportPostWidget> {
  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    final authorName = _getAuthorNameFromUrl(widget.report.image);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _buildPdfPreview(context, authorName),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildPdfPreview(BuildContext context, String authorName) {
    return GestureDetector(
      onTap: () {}, // Handled by button below
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: PhinexaColor.grey, width: 1.5),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // PDF Preview Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Container(
                height: 200,
                width: double.infinity,
                color: PhinexaColor.grey.withOpacity(0.1),
                child: Stack(
                  children: [
                    // PDF Preview with better zoom
                    SfPdfViewer.network(
                      widget.report.image,
                      canShowScrollHead: false,
                      canShowScrollStatus: false,
                      canShowPaginationDialog: false,
                      enableDoubleTapZooming: false,
                      enableTextSelection: false,
                      interactionMode: PdfInteractionMode.pan,
                      pageLayoutMode: PdfPageLayoutMode.single,
                      initialZoomLevel: 1,
                      onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
                        // Fallback UI if PDF fails to load
                      },
                    ),
                    // Overlay to prevent interaction
                    Positioned.fill(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    // Top gradient overlay for better text visibility
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    // PDF indicator badge
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: PhinexaColor.primaryLightBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.picture_as_pdf,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'PDF',
                              style: PhinexaFont.captionAccent.copyWith(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Report Info Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.report.title,
                    style: PhinexaFont.contentAccent,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'By $authorName',
                    style: PhinexaFont.captionRegular.copyWith(
                      color: PhinexaColor.darkGrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.report.description,
                        style: PhinexaFont.captionRegular.copyWith(
                          color: PhinexaColor.darkGrey,
                        ),
                        maxLines: _isDescriptionExpanded ? null : 3,
                        overflow: _isDescriptionExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                      ),
                      if (widget.report.description.length > 100) // Show toggle if text is long
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDescriptionExpanded = !_isDescriptionExpanded;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              _isDescriptionExpanded ? 'See less' : 'See more',
                              style: PhinexaFont.captionAccent.copyWith(
                                color: PhinexaColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    label: "View Report",
                    onPressed: () {
                      context.pushNamed(
                        RouteName.reportMore,
                        extra: widget.report,
                      );
                    },
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- FINAL WORKING FUNCTION FOR FIREBASE URLS ---
  String _getAuthorNameFromUrl(String url) {
    try {
      // 1. Create a Uri object from the full URL string.
      final uri = Uri.parse(url);

      final encodedPath = uri.pathSegments.last;

      final decodedPath = Uri.decodeComponent(encodedPath);

      final pathParts = decodedPath.split('/');

      if (pathParts.length >= 2) {
        return pathParts[pathParts.length - 2];
      }

      return 'Unknown Author'; // Fallback
    } catch (e) {
      print("Error parsing Firebase URL: $e");
      return 'Unknown Author'; // Fallback
    }
  }
}
