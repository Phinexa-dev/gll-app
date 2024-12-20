import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/feedback.dart';
import '../provider/feedback_provider.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class FeedbackListener extends ConsumerWidget {
  final Widget child;

  const FeedbackListener({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the message stream
    ref.listen<AsyncValue<FeedbackModel>>(feedbackStreamProvider, (previous, next) {
      next.whenOrNull(data: (message) {
        final scaffoldMessengerState = scaffoldMessengerKey.currentState;
        if (scaffoldMessengerState != null) {
          scaffoldMessengerState.showSnackBar(
            SnackBar(
              content: Text(next.value!.content),
              backgroundColor: _getColorForType(next.value!.type),
            ),
          );
        }
      });
    });

    return child;
  }

  Color _getColorForType(FeedbackType type) {
    switch (type) {
      case FeedbackType.success:
        return Colors.green;
      case FeedbackType.error:
        return Colors.red;
      case FeedbackType.info:
      return Colors.blue;
    }
  }
}