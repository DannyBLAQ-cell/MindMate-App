import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'main_page.dart';
import './features/posts/presentation/providers/chat_provider.dart';
import './features/posts/data/datasources/gemini_service.dart';

void main() {
  // Initialize Gemini service
  final geminiService = GeminiService(apiKey: "AIzaSyAJLPZXal8zoNEFjVyc9_WUzVNb6RV484k");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(geminiService: geminiService),
        ),
      ],
      child: const MindMate(),
    ),
  );
}

class MindMate extends StatelessWidget {
  const MindMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindMate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}


// class MyPosts extends StatelessWidget {
//   const MyPosts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'POSTS',
//             theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
//         useMaterial3: true,
//       ),

// home:const PostsPage(),
     
//     );
//   }
// }