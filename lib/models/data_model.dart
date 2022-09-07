

class News {
  String? author;
  String? content;
  String? date;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

  News(
      {this.author,
        this.content,
        this.date,
        this.imageUrl,
        this.readMoreUrl,
        this.time,
        this.title,
        this.url});

  News.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
    date = json['date'];
    imageUrl = json['imageUrl'];
    readMoreUrl = json['readMoreUrl'];
    time = json['time'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['content'] = this.content;
    data['date'] = this.date;
    data['imageUrl'] = this.imageUrl;
    data['readMoreUrl'] = this.readMoreUrl;
    data['time'] = this.time;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}





// class Data {
//   String? author;
//   String ?content;
//   String ?date;
//   String ?imageUrl;
//   String ?readMoreUrl;
//   String ?time;
//   String ?title;
//   String ?url;
//
//   Data({
//        this.author,
//        this.content,
//        this.date,
//        this.imageUrl,
//        this.readMoreUrl,
//       this.time,
//       this.title,
//        this.url,});
//
//   Data.fromJson(dynamic json) {
//     author = json['author'];
//     content = json['content'];
//     date = json['date'];
//     imageUrl = json['imageUrl'];
//     readMoreUrl = json['readMoreUrl'];
//     time = json['time'];
//     title = json['title'];
//     url = json['url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['author'] = author;
//     map['content'] = content;
//     map['date'] = date;
//     map['imageUrl'] = imageUrl;
//     map['readMoreUrl'] = readMoreUrl;
//     map['time'] = time;
//     map['title'] = title;
//     map['url'] = url;
//     return map;
//   }
//
// }