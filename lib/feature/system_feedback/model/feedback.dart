
enum FeedbackType { success, error, info }

class FeedbackModel {
  final String content;
  final FeedbackType type;

  FeedbackModel({required this.content, required this.type});
}