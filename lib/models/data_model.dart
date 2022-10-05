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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['content'] = content;
    data['date'] = date;
    data['imageUrl'] = imageUrl;
    data['readMoreUrl'] = readMoreUrl;
    data['time'] = time;
    data['title'] = title;
    data['url'] = url;
    return data;
  }
}