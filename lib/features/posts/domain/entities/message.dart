class Message {
  final String id;
   String text;
  final bool isUser; // true = user message, false = AI message
  final DateTime time;

  Message({
    required this.id,
    required this.text,
    required this.isUser,
    required this.time,
  });
}
