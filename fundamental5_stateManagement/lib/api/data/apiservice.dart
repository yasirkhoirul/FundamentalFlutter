import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:tourism_app/api/model/tourism.dart';


class Apiservice {
  static const String _baseUrl = "https://tourism-api.dicoding.dev";

  Future<Tourismlist> getResponseTourism() async{
    final reponse = await http.get(Uri.parse("$_baseUrl/list"));
    final data = Tourismlist.fromJson(jsonDecode(reponse.body));
    if (reponse.statusCode == 200) {
      Logger().d(data.message);
      return data;
    }else{
      throw Exception("failed to load list");
    }
    
  }

  Future<Detialtourism> getDetailTOurism(int id) async {
    final respones = await http.get(Uri.parse("$_baseUrl/detail/$id"));
    if(respones.statusCode == 200){
      final data = Detialtourism.fromJson(jsonDecode(respones.body));
      return data;
    }else{
      throw Exception("terjadi kesalahan");
    }
  }
}