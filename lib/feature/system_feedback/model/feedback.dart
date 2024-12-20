
enum MessageType { success, error, info }

class Message {
  final String content;
  final MessageType type;

  Message({required this.content, required this.type});
}