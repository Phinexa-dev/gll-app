import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/message.dart';
import '../provider/message_provider.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MessageListener extends ConsumerWidget {
  final Widget child;

  const MessageListener({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the message stream
    ref.listen<AsyncValue<Message>>(messageStreamProvider, (previous, next) {
      final messenger = scaffoldMessengerKey.currentState;
      if (messenger != null) {
        messenger.showSnackBar(
          SnackBar(
            content: Text(next.value!.content),
            backgroundColor: _getColorForType(next.value!.type),
          ),
        );
      }
        });

    return child;
  }

  Color _getColorForType(MessageType type) {
    switch (type) {
      case MessageType.success:
        return Colors.green;
      case MessageType.error:
        return Colors.red;
      case MessageType.info:
      return Colors.blue;
    }
  }
}