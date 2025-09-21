import 'package:flutter/material.dart';
import 'package:tourism_app/provider/main/indexNav.dart';
import 'package:tourism_app/screen/home/bookmark_screen.dart';
import 'package:tourism_app/screen/home/home_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<Indexnav>(
      builder: (context,value,child) {
        return Scaffold(
          body: switch(value.indexbotnavbar){
            0 => const HomeScreen(),
            _ => const BookmarkScreen()
          },
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => context.read<Indexnav>().setindexnavbar = value,
            currentIndex: context.watch<Indexnav>().indexbotnavbar,
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",tooltip: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "bookmark",tooltip: 'bookmark'),
            ],
        
          ),
        );
      }
    );
  }
}