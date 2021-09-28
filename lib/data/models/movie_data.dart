import 'dart:convert';

import 'actor_data.dart';

class MovieModel {
  final String id;
  final String title;
  final String image;
  final List<ActorModel> actorList;

  MovieModel({
    required this.id,
    required this.title,
    required this.image,
    required this.actorList,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'actorList': actorList?.map((x) => x.toMap())?.toList(),
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      actorList: List<ActorModel>.from(
          map['actorList']?.map((x) => ActorModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
