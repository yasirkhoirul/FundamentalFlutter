import 'package:flutter/material.dart';
import 'card_turis_widget.dart';
import 'package:fundamental1/model/model.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism List"),
      ),
      body: ListView.builder(
        itemCount: tourismList.length,
        itemBuilder: (context, index) {
          final tourism = tourismList[index];
     
          return Turis(tourism: tourism);
        },
      ),
    );
  }
}
