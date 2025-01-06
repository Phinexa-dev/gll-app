import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/feedback.dart';

class FeedbackService {
  static final FeedbackService _instance = FeedbackService._internal();
  factory FeedbackService() => _instance;

  FeedbackService._internal();

  final StreamController<FeedbackModel> _feedbackController = StreamController<FeedbackModel>.broadcast();

  Stream<FeedbackModel> get feedbacks => _feedbackController.stream;

  void showSnackBar(String content, FeedbackType type) {
    _feedbackController.add(FeedbackModel(content: content, type: type));
  }

  void showToast(String message, {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void dispose() {
    _feedbackController.close();
  }
}