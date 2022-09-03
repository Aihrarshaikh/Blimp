import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:knows/models/Data_model.dart';
List<Data> nuzzs = [];
List<Data> nuzznational = [];
List<Data> nuzzbusiness = [];
List<Data> nuzzsports = [];
List<Data> nuzzworld = [];
List<Data> nuzzpolitics = [];
List<Data> nuzzstartup= [];
List<Data> nuzzentertainment = [];
List<Data> nuzzmiscellaneous = [];
List<Data> technuzz = [];

Future<void> getmischef() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
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
        nuzzmiscellaneous.add(data);
      }
    });
  }
}

Future<void> getentertainment() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
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
        nuzzentertainment.add(data);
      }
    });
  }
}

Future<void> getstartup() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
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
        nuzzstartup.add(data);
      }
    });
  }
}

Future<void> getpolitics() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
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
        nuzzpolitics.add(data);
      }
    });
  }
}

Future<void> getworld() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
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
        nuzzworld.add(data);
      }
    });
  }
}

Future<void> getsports() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
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
        nuzzsports.add(data);
      }
    });
  }
}

Future<void> getbusiness() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
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
        nuzzbusiness.add(data);
      }
    });
  }
}



Future<void> getallnuz() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=all'));
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
        nuzzs.add(data);
      }
    });
  }
}

Future<void> gettech() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
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
        technuzz.add(data);
      }
    });
  }
}

Future<void> getnational() async {
  final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=all'));
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
        nuzznational.add(data);
      }
    });
  }
}