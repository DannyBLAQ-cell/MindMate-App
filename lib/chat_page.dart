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

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
 // ignore: unused_local_variable
 final chatProvider=Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
          // consumer chatprovider is used to listen to changes that trigger the api request
           Consumer<ChatProvider>(
           builder: (context,chatProvider,child)
           {
            // list view.builder makes a scrllable list of messages and loops over the messages in the chat provider
               return ListView.builder(
                controller: _scrollController,
              padding: const EdgeInsets.only(bottom: 80, top: 16, right: 16, left: 16),
              itemCount:chatProvider.messages.length,
              itemBuilder:(context, index){
              final message=chatProvider.messages[index];
              final isUser= message.isUser;
              return Align(
                  // this condition checks..if the message is sent by user align to the right else if its the ai align to the left
                 alignment: isUser? Alignment.centerRight: Alignment.centerLeft,

                //  this is the styling for the chat bubbles
            child: Container(
             margin: const EdgeInsets.symmetric(vertical: 6.0),
             padding: const EdgeInsets.all(12.0),
             decoration: BoxDecoration(
               color: isUser ? Colors.orangeAccent : Colors.white,
               borderRadius: BorderRadius.circular(16.0),
              ),
              // this changes the text based on who sent the message
              child: Text(
               message.text,
               style: TextStyle(
                 color: isUser ? Colors.white : Colors.black,
                 fontSize: 16.0,
               ),
              ),
              ),
                );
               },
         );
       },
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
                        controller: _controller,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: 'Ask Anything...',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      // this check if text isnt empty send to gemini and clear input after send
                      
                      onPressed: () {
                      if (_controller.text.trim().isNotEmpty)
                      {
                          chatProvider.sendMessage(_controller.text.trim());
                          _controller.clear();
                      }
                      Future.delayed(Duration(milliseconds: 300),(){
                          _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          );
                        }
                        );
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
