class Data {
  String? author;
  String ?content;
  String ?date;
  String ?imageUrl;
  String ?readMoreUrl;
  String ?time;
  String ?title;
  String ?url;

  Data({
       this.author,
       this.content,
       this.date,
       this.imageUrl,
       this.readMoreUrl,
      this.time,
      this.title,
       this.url,});

  Data.fromJson(dynamic json) {
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
    final map = <String, dynamic>{};
    map['author'] = author;
    map['content'] = content;
    map['date'] = date;
    map['imageUrl'] = imageUrl;
    map['readMoreUrl'] = readMoreUrl;
    map['time'] = time;
    map['title'] = title;
    map['url'] = url;
    return map;
  }

}