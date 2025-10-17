import 'package:flutter/foundation.dart';
import '../../domain/entities/message.dart';
import '../../domain/usecases/send_message.dart';

class ChatProvider extends ChangeNotifier {
  final SendMessage sendMessageUseCase;

  ChatProvider({required this.sendMessageUseCase});

 final List<Message> _messages = [];
  List<Message> get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> sendMessage(String text) async {
    // Add user message to screen immediately
    _messages.add(Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      time: DateTime.now(),
    ));
    notifyListeners();

    _isLoading = true;
    notifyListeners();

    // Send to GPT using use case
    final reply = await sendMessageUseCase(text);
    _messages.add(reply);

    _isLoading = false;
    notifyListeners();
  }
}
