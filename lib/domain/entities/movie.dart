import 'package:equatable/equatable.dart';

import 'actor.dart';

class Movie extends Equatable {
  final String id;
  final String title;
  final String image;
  final List<Actor> actorList;

  const Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.actorList,
  });

  @override
  List<Object?> get props => [id, title, image, actorList];
}
