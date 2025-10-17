import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/message.dart';

class ChatRemoteDataSource {
  final http.Client client;
  final String apiKey;

  ChatRemoteDataSource({required this.client, required this.apiKey});

  Future<Message> sendMessage(String text) async {
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey"
    );
    
    final response = await client.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": text}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final reply = data['candidates'][0]['content']['parts'][0]['text'];

      return Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: reply,
          isUser: false,
        time: DateTime.now(),
      );
    } else {
      throw Exception("Failed to connect to Gemini API: ${response.body}");
    }
  }
}
