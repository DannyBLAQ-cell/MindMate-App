import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      
    

       body: 
       Stack(
        children: [
       Container(
        
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
        ),
        ),
       ),
          Container(
      color: Colors.black.withOpacity(0.3),
    ),
        Center(
        child: Padding(padding: const EdgeInsets.only(top:250.0),
        
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
         children: [
           const Icon(
            Icons.psychology_alt_sharp,
            size: 100,
            color: Colors.white,
           ),
         const Text(    'Welcome to    \nMindMate',
          style: TextStyle(fontSize: 58, fontWeight: FontWeight.bold, color: Colors.white), 
          textAlign: TextAlign.center, 
          ),
          const Text('Danny',
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(  'Your personal AI mood journal.\nHow are you feeling today?',
          style: TextStyle(fontSize:17,color: Colors.white ), textAlign: TextAlign.center, 
          ),
          SizedBox(height: 30), 
        //     ElevatedButton(onPressed:   () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => const ChatPage()),
        //       );
        //     },
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.white,
        // minimumSize: const Size(150, 50),
        //       ),
            
        //      child: const  Text('Start Chat', style: TextStyle(fontSize: 18),))


         ], 
         
          
        ),

        ),
        
        ),
        ],
       ),
        
      );
  }
}