import 'package:flutter/material.dart';
import 'package:tourism_app/screen/home/bookmark_screen.dart';
import 'package:tourism_app/screen/home/home_screen.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indexbotoomnav = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: switch(_indexbotoomnav){
        0 => const HomeScreen(),
        _ => const BookmarkScreen()
      },
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() {
          _indexbotoomnav = value;
        }),
        currentIndex: _indexbotoomnav,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",tooltip: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "bookmark",tooltip: 'bookmark'),
        ],

      ),
    );
  }
}