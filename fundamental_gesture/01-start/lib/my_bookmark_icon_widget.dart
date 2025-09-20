import 'package:flutter/material.dart';

class MyBookmarkIconWidget extends StatefulWidget {
  const MyBookmarkIconWidget({super.key});

  @override
  State<MyBookmarkIconWidget> createState() => _MyBookmarkIconWidgetState();
}

class _MyBookmarkIconWidgetState extends State<MyBookmarkIconWidget> {
  // todo-tap-01: create a variable that control Icons
  bool _isbookmark = false;
  @override
  Widget build(BuildContext context) {
    // todo-tap-02: wrap the Icon with GestureDetector

    // todo-tap-03: add onTap callback and set the variable differently

    return GestureDetector(
      onTap: () => setState(() {
        _isbookmark = !_isbookmark;
      }),
      child: Icon(
        // todo-tap-04: change the icon and color based on value
        _isbookmark? Icons.bookmark : Icons.bookmark_outline,
        color: _isbookmark? Colors.amber:Colors.grey,
        size: 60,
      ),
    );
  }
}
