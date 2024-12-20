import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/feedback_service.dart';
import '../model/feedback.dart';

final feedbackServiceProvider = Provider<FeedbackService>((ref) {
  return FeedbackService();
});

final feedbackStreamProvider = StreamProvider<FeedbackModel>((ref) {
  final feedbackService = ref.watch(feedbackServiceProvider);
  return feedbackService.feedbacks;
});
