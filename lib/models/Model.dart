import 'Data.dart';
import 'package:http/http.dart' as http;
class Model {
  Model({
      this.category,
      this.data,
      this.success,});

  Model.fromJson(dynamic json) {
    category = json['category'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    success = json['success'];
  }
  String? category;
  List<Data>? data;
  bool ?success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    return map;
  }

}