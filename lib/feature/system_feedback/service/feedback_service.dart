import 'dart:async';
import '../model/feedback.dart';

class FeedbackService {
  static final FeedbackService _instance = FeedbackService._internal();
  factory FeedbackService() => _instance;

  FeedbackService._internal();

  final StreamController<FeedbackModel> _feedbackController = StreamController<FeedbackModel>.broadcast();

  Stream<FeedbackModel> get feedbacks => _feedbackController.stream;

  void snackBar(String content, FeedbackType type) {
    _feedbackController.add(FeedbackModel(content: content, type: type));
  }

  void dispose() {
    _feedbackController.close();
  }
}