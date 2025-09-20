import 'package:flutter/material.dart';
import 'package:fundamental1/model/model.dart';
import 'package:fundamental1/screen/home/detail_screen.dart';
import 'package:fundamental1/screen/home/home_screen.dart';
import 'package:fundamental1/style/theme.dart';
void main() {
 runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
 const MyApp({super.key});
 
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: TurisTheme.lightTheme,
     darkTheme: TurisTheme.darkTheme,
     themeMode: ThemeMode.system,
     initialRoute: "/",
     routes: {
      "/":(context) => const Homescreen(),
      "/detail":(context) => DetailScreen(tourism: ModalRoute.of(context)?.settings.arguments as Tourism)
     },
   );
 }
}



