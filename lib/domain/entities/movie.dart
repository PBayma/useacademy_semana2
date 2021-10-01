import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';
import 'entities.dart';

class Movie extends Equatable {
  final String id;
  final String title;
  final String image;
  final String plot;
  final List<ActorModel> actorList;
  final List<StarActor> starList;

  const Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.plot,
    required this.actorList,
    required this.starList,
  });

  @override
  List<Object?> get props => [id, title, image, plot, actorList];
}
