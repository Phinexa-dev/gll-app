import 'dart:async';
import '../model/message.dart';

class MessageService {
  static final MessageService _instance = MessageService._internal();
  factory MessageService() => _instance;

  MessageService._internal();

  final StreamController<Message> _messageController = StreamController<Message>.broadcast();

  Stream<Message> get messages => _messageController.stream;

  void showMessage(String content, MessageType type) {
    _messageController.add(Message(content: content, type: type));
  }

  void dispose() {
    _messageController.close();
  }
}