import 'package:flutter/material.dart';

class Indexnav extends ChangeNotifier{
  int _indexbottomnavbar = 0;

  int get indexbotnavbar => _indexbottomnavbar;

  set setindexnavbar(int value){
    _indexbottomnavbar = value;
    notifyListeners();//berguna untuk mengabari
  }
}