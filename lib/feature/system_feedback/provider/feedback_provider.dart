import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/message_service.dart';
import '../model/message.dart';

final messageServiceProvider = Provider<MessageService>((ref) {
  return MessageService();
});

final messageStreamProvider = StreamProvider<Message>((ref) {
  final messageService = ref.watch(messageServiceProvider);
  return messageService.messages;
});
