import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';

class BookmarkProvider extends ChangeNotifier{
  final List<Tourism> _bookmark = [];

  List<Tourism> get bookmark => _bookmark;
  void addbookmark (Tourism data){
    _bookmark.add(data);
    notifyListeners();
  }
  void removebookmark (Tourism data){
    _bookmark.removeWhere(
      (element) => element.id == data.id,
    );
    notifyListeners();
  }

  bool checkBookmark(Tourism data){
    final ischeck = _bookmark.where((element) => element.id == data.id,);
    if(ischeck.isEmpty){
      return false;
    }else{
      return true;
    }
  }
}