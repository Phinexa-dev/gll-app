import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/theme/fonts.dart';
import 'package:gll/common/widget/custom_button.dart';
import 'button_widget.dart';

class SipReportPostWidget extends ConsumerWidget {
  final SipReport report;

  const SipReportPostWidget({super.key, required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _buildUserInfo(),
          const SizedBox(height: 8),
          _buildPostDetails(),
          if (report.imageUrl != null) ...[
            const SizedBox(height: 8),
            _buildPostImage(),
          ],
          const SizedBox(height: 8),
          _buildImpactDetails(),
          const SizedBox(height: 8),
          _buildPostDescription(),
          const SizedBox(height: 16),
          _buildViewReportButton(),
          const SizedBox(height: 12),
          _buildInteractionButtons(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  // User info section with avatar and timestamps
  Widget _buildUserInfo() {
    return Row(
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
    );
  }

  // Post title and location with overflow handling
  Widget _buildPostDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          report.postTitle,
          style: PhinexaFont.highlightEmphasis,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          report.postLocation,
          style: PhinexaFont.contentRegular,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }

  // Display post image if available
  Widget _buildPostImage() {
    return ClipRRect(
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
    );
  }

  // Impact section with overflow handling
  Widget _buildImpactDetails() {
    return Text.rich(
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
    );
  }

  // Detailed description of the post with overflow handling
  Widget _buildPostDescription() {
    return Text.rich(
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
    );
  }

  // View Report button
  Widget _buildViewReportButton() {
    return CustomButton(
      label: "View Report",
      onPressed: () => print("pressed view report"),
      height: 30,
    );
  }

  // Interaction buttons (like, comment, share)
  Widget _buildInteractionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButtonWidget(
          isSelected: report.isLiked,
          isLikeButton: true,
          onPressed: () => print("pressed like btn"),
          imagePath: 'assets/resources/like_btn.svg',
          pressedImagePath: 'assets/resources/like_btn_prsd.svg',
          amount: report.likeCount,
        ),
        IconButtonWidget(
          onPressed: () => print("pressed comment btn"),
          imagePath: 'assets/resources/comment_btn.svg',
          amount: report.commentCount,
        ),
        IconButtonWidget(
          onPressed: () => print("pressed share btn"),
          imagePath: 'assets/resources/share_btn.svg',
          amount: report.shareCount,
        ),
      ],
    );
  }
}


class SipReport {
  final String userName;
  final String userAvatarUrl;
  final String? imageUrl;
  final String timestamp;
  final String postTitle;
  final String postLocation;
  final String impactText;
  final String description;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final bool isLiked;

  SipReport({
    required this.userName,
    required this.userAvatarUrl,
    this.imageUrl,
    required this.timestamp,
    required this.postTitle,
    required this.postLocation,
    required this.impactText,
    required this.description,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.isLiked,
  });
}
