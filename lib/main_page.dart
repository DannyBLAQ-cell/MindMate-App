import 'package:flutter/material.dart';
import 'package:mindmate/chat_page.dart';
import 'package:mindmate/home_page.dart';
import 'package:mindmate/mood_page.dart';
import 'package:mindmate/activity_page.dart';
import 'package:mindmate/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    // this saves the initial state of the index
  
  int _selectedIndex = 0; 

// this is used to create a nonchanging list that contains widgets 
  final List<Widget> _pages =[
const HomePage(),
const ChatPage(),
const MoodPage(),
const ActivityPage(),
const SettingPage(),
  ];
// this function is used to change the index of the selected 
//item in the bottom navigation bar
void _onItemTapped(int index){
  // call set state to update the UI
  setState(() {
    // change the index of the selected item
    _selectedIndex=index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // show the selected page
body:


 _pages[_selectedIndex],
// bottom navigation bar is a widget thats used to show a bar at the bottom of the screen
bottomNavigationBar:Container(
height: 65,
child: Stack(
children: [

       Container(
 color: Colors.orange,
      ),

      // dark overlay
      Container(
        color: Colors.black.withOpacity(0.3),
      ),


 BottomNavigationBar(
  // this is used to show the items that is selected
type: BottomNavigationBarType.fixed,
  
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  selectedItemColor: Colors.orange,
  unselectedItemColor: Colors.grey,
  backgroundColor: Colors.transparent,
  iconSize: 30,
  
  items:const[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bubble_chart_outlined),
   
      label: 'Chats',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart_rounded),
   
      label: 'Mood',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.self_improvement_rounded),
   
      label: 'Activities',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
   
      label: 'Settings',
    ),
  ]
),
],
),
),
    );
  }
}