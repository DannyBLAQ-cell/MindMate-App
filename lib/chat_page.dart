import 'package:flutter/material.dart';
import 'package:mindmate/features/posts/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}
// this is a text editting cotroller for the input field to acces chat provider so i can send messages
class _ChatPageState extends State<ChatPage> {

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
 // ignore: unused_local_variable
 final chatProvider=Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(b
          'MindMate',
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.white),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Container(color: Colors.black.withOpacity(0.3)),

          Center(
            child: const Text(
              'How are you feeling today 😊?',
              style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 55,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: 'Ask Anything...',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // we will add send message logic here later
                      },
                      icon: const Icon(Icons.send, color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
