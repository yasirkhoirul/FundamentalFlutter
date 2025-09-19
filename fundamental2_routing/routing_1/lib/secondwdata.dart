    import 'package:flutter/material.dart';
     
    class SecondScreenWithData extends StatelessWidget {
     const SecondScreenWithData({super.key,required this.pesan});
     final String pesan;
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              Text(pesan),
               ElevatedButton(
                 child: const Text('Back'),
                 onPressed: () {
                   Navigator.pop(context);
                 },
               ),
             ],
           ),
         ),
       );
     }
    }