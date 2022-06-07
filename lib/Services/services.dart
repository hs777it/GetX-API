import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/ebook.dart';

class DataServices {
  static var client = http.Client();
  static Future getEbook() async {
    String url = 'https://smartmedia-kw.com/abook/api.php?allbook';
     var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return fromJson(json.decode(response.body));
    }else{
      return null;
    }
  }

  static Future<List<Ebook>> getEbooks() async {
    String url = 'https://smartmedia-kw.com/abook/api.php?allbook';
    final response = await http.get(Uri.parse(url),headers:{"Content-Type":
    "application/json"});
    return fromJson(json.decode(response.body));
  }




}

