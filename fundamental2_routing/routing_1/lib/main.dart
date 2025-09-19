import 'package:flutter/material.dart';
import 'package:routing_1/anotherscree.dart';
import 'package:routing_1/first_screen.dart';
import 'package:routing_1/replalcementscreen.dart';
import 'package:routing_1/return.dart';
import 'package:routing_1/second_screen.dart';
import 'package:routing_1/secondwdata.dart';
 
void main() {
 runApp(const MainApp());
}
 
class MainApp extends StatelessWidget {
 const MainApp({super.key});
 
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => const FirstScreen(),
      '/second':(context) => const SecondScreen(),
      '/secondwdata':(context)=>SecondScreenWithData(
        pesan: ModalRoute.of(context)?.settings.arguments as String,
      ),
      '/return':(context)=> const ReturnDataScreen(),
      '/replacement':(context)=>const ReplacementScreen(),
      '/another':(context)=> const AnotherScreen()
    },
   );
 }
}