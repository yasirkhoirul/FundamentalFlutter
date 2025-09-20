import 'dart:ffi';

import 'package:flutter/material.dart';

class MyContainerWidget extends StatefulWidget {
  const MyContainerWidget({super.key});

  @override
  State<MyContainerWidget> createState() => _MyContainerWidgetState();
}

class _MyContainerWidgetState extends State<MyContainerWidget> {
  // todo-double-tap-01: create a variable size for zoom instantly and add fixedSize for specific size
  
  // todo-scale-01: create a variable scale for zoom
  double size = 150;
  final List<double> changesize = [150,250,300];
  @override
  Widget build(BuildContext context) {
    // todo-double-tap-02: wrap with GestureDetector

    // todo-double-tap-03: add onDoubleTap callback and set the baseSize

    // todo-scale-02: wrap this widget with Transform.scale and add scale parameter

    // todo-scale-03: add some callback for scale the GestureDetector widget

    
    // todo-scale-04: set scale value to default on onDoubleTap callback
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          size = switch(size){
            <= 150 => size = changesize[1],
            <= 250 => size = changesize[2],
            <= 300 => size = changesize[0],
            _ => changesize[0],
          };
        });
      },
      child: Image.asset(
        "assets/cat.jpeg",
        fit: BoxFit.cover,
        // todo-double-tap-04: change width and height into the baseSize variable
        height: size,
        width: size,
      ),
    );
  }
}
