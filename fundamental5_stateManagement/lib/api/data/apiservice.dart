import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tourism_app/api/model/tourism.dart';


class Apiservice {
  static const String _baseUrl = "https://tourism-api.dicoding.dev";

  Future<Tourismlist> getResponseTourism() async{
    final reponse = await http.get(Uri.parse("$_baseUrl/list"));

    if (reponse.statusCode == 200) {
      return Tourismlist.fromJson(jsonDecode(reponse.body));
    }else{
      throw Exception("failed to load list");
    }
    
  }
}