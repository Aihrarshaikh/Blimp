import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:knows/models/Data_model.dart';
List<Data> nuzzscience = [];
Future<void> getsciencenews() async {
  List<Data> nuzzscience = [];
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=science'));
  var jsonData = jsonDecode(response.body);
  if (jsonData['success']==true) {
    jsonData['data'].forEach((element){
      if(element['readMoreUrl']!=null){
        Data data = Data(
          author : element['author'],
          content : element['content'],
          date : element['date'],
          imageUrl : element['imageUrl'],
          readMoreUrl : element['readMoreUrl'],
          time : element['time'],
          title : element['title'],
          url : element['url'],
        );
        nuzzscience.add(data);
      }
    });
  }
}