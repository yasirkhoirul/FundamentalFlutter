import 'package:flutter/material.dart';
import 'package:routing_1/first_screen.dart';
 
void main() {
 runApp(const MainApp());
}
 
class MainApp extends StatelessWidget {
 const MainApp({super.key});
 
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home: const FirstScreen(),
   );
 }
}