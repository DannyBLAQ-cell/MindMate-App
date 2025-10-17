import 'package:flutter/material.dart';
// import 'package:mindmate/features/posts/presentation/posts_page.dart';
import 'package:mindmate/main_page.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import './features/posts/presentation/providers/chat_provider.dart';
import 'features/posts/domain/usecases/send_message.dart';
import 'features/posts/data/repositories/chat_repository_impl.dart';
import 'features/posts/data/datasources/chat_remote_data_source.dart';

void main() {
// this for my api key
const openAiApiKey = 'AIzaSyAJLPZXal8zoNEFjVyc9_WUzVNb6RV484k';

// Set up data layer
  final chatRemoteDataSource = ChatRemoteDataSource(
    client: http.Client(),
    apiKey: openAiApiKey,
  );

  // Set up repository
  final chatRepository = ChatRepositoryImpl(
    remoteDataSource: chatRemoteDataSource,
  );

// Set up usecase
  final sendMessageUseCase = SendMessage(chatRepository);
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(sendMessageUseCase: sendMessageUseCase),
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

home:const MainPage(),
     
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