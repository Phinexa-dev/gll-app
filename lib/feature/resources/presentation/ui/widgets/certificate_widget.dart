import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';

import '../screen/certification_tab_screen.dart';

class CertificateWidget extends ConsumerWidget {
  final Certificate certificate;
  const CertificateWidget({super.key, required this.certificate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        margin:  EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: PhinexaColor.certficateBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        certificate.title,
                        style: PhinexaFont.highlightEmphasis,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8),
                      Text(
                        certificate.organization,
                        style: PhinexaFont.highlightRegular,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        certificate.duration,
                        style: PhinexaFont.highlightRegular,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 54,
                  height: 54,
                  child: Image.asset(
                    'assets/resources/certificate_icon.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              certificate.description,
              style: PhinexaFont.contentEmphasis,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCompletedChip(context),
                _buildShareButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCompletedChip(BuildContext context) {
  return Chip(
        avatar: Icon(Icons.check, color: PhinexaColor.darkGrey),
        label: Text(
          'Completed',
          style: PhinexaFont.captionEmphasis.copyWith(color: PhinexaColor.darkGrey)
        ),
        backgroundColor: PhinexaColor.lightGreen,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: PhinexaColor.darkGreen,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
  );
}

Widget _buildShareButton(BuildContext context) {
  return ElevatedButton.icon(
        onPressed: () {
          print('Share button pressed');
        },
        icon: Text(
          'Share',
          style: PhinexaFont.contentAccent.copyWith(color: PhinexaColor.white)
        ),
        label: Icon(Icons.share_outlined,color: PhinexaColor.white,),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: PhinexaColor.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      );

}