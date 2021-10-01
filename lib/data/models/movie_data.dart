import 'dart:convert';

import '../../domain/entities/movie.dart';
import 'actor_data.dart';
import 'star_actor_data.dart';

class MovieModel extends Movie {
  const MovieModel({
    required String id,
    required String title,
    required String image,
    required String plot,
    required List<ActorModel> actorList,
    required List<StarActorModel> starList,
  }) : super(
          id: id,
          title: title,
          image: image,
          plot: plot,
          actorList: actorList,
          starList: starList,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'plot': plot,
      'actorList': actorList.map((x) => x.toMap()).toList(),
      'starList': actorList.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      plot: map['plot'] ?? '',
      actorList: map['actorList'] == null
          ? []
          : List<ActorModel>.from(
              map['actorList']?.map((x) => ActorModel.fromMap(x))),
      starList: map['starList'] == null
          ? []
          : List<StarActorModel>.from(
              map['starList']?.map((x) => StarActorModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
