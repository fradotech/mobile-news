import 'dart:convert';

NewsModel newsModelFromMap(String str) => NewsModel.fromMap(json.decode(str));

String newsModelToMap(NewsModel data) => json.encode(data.toMap());

class NewsModel {
  NewsModel({
    this.data,
  });

  List<Datum> data;

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.picture,
    this.content,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String picture;
  String content;
  String isPublished;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    picture: json["picture"],
    content: json["content"],
    isPublished: json["is_published"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "picture": picture,
    "content": content,
    "is_published": isPublished,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
