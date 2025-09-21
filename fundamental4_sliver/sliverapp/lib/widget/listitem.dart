import 'package:flutter/material.dart';
import 'package:sliverapp/data/kelasOnline.dart';

class Listitem extends StatelessWidget{
  final Kelasonline data;
  const Listitem({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(data.title),
      leading: Icon(Icons.person),
      subtitle: Text(data.description,overflow: TextOverflow.ellipsis,maxLines: 5,),
      isThreeLine: true,
      onTap: () => {},

    );
  }

}