import 'data_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<News>> getnews(String category) async {
    try {
      final url = 'https://inshorts.deta.dev/news?category=$category';
      final response = await _dio.get(url);
      var news = response.data['data'] as List;
      List<News> newsList = news.map((m) => News.fromJson(m)).toList();
      print(newsList[0]);
      return newsList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}

// class Model {
//   Model({
//       this.category,
//       this.data,
//       this.success,});
//
//   Model.fromJson(dynamic json) {
//     category = json['category'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     success = json['success'];
//   }
//   String? category;
//   List<Data>? data;
//   bool ?success;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['category'] = category;
//     if (data != null) {
//       map['data'] = data!.map((v) => v.toJson()).toList();
//     }
//     map['success'] = success;
//     return map;
//   }
//
// }
