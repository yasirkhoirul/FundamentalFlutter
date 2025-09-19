import 'package:flutter/material.dart';
 
class FirstScreen extends StatelessWidget {
 const FirstScreen({super.key});
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Navigation & Routing'),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           ElevatedButton(
             child: const Text('Go to Second Screen'),
             onPressed: () {
              Navigator.pushNamed(context, '/second');
             },
           ),
           ElevatedButton(
             child: const Text('Navigation with Data'),
             onPressed: () {
              Navigator.pushNamed(context, '/secondwdata',arguments: "halo ini dari first screen");
             },
           ),
           ElevatedButton(
             child: const Text('Return Data from Another Screen'),
             onPressed: () async{
              final result = await Navigator.pushNamed(context, '/return');
              if (!context.mounted || result is! String) return;
               SnackBar snackBar = SnackBar(content: Text(result));
               ScaffoldMessenger.of(context).showSnackBar(snackBar);
             },
           ),
           ElevatedButton(
             child: const Text('Replace Screen'),
             onPressed: () {
              Navigator.pushNamed(context, '/replacement');
             },
           ),
         ],
       ),
     ),
   );
 }
}