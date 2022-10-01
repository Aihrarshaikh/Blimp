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
      return newsList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
