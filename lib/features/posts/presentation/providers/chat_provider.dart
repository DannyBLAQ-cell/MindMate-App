import 'package:flutter/foundation.dart';
import '../../domain/entities/message.dart';
import '../../data/datasources/gemini_service.dart';

class ChatProvider extends ChangeNotifier {
  final GeminiService geminiService;

  ChatProvider({required this.geminiService});

  List<Message> _messages = [];
  List<Message> get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Send message function
  Future<void> sendMessage(String userText) async {
    if (userText.isEmpty) return;

    // Show user message instantly in chat
    _messages.add(Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: userText,
      isUser: true,
      time: DateTime.now(),
    ));
    notifyListeners();

    // Send to Gemini
    _isLoading = true;
    notifyListeners();

    try {
      final replyText = await geminiService.sendMessage(userText);
      _messages.add(Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: replyText,
        isUser: false,
        time: DateTime.now(),
      ));
    } catch (e) {
      _messages.add(Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: "Error: Could not connect to AI.",
        isUser: false,
        time: DateTime.now(),
      ));
    }

    _isLoading = false;
    notifyListeners();
  }
}
