import 'package:equatable/equatable.dart';
import '../../data/models/models.dart';

class Movie extends Equatable {
  final String id;
  final String title;
  final String image;
  final String plot;
  final List<ActorModel> actorList;

  const Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.plot,
    required this.actorList,
  });

  @override
  List<Object?> get props => [id, title, image, plot, actorList];
}
