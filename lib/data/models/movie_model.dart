import 'package:useacademy_semana2/data/models/actor_model.dart';

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
}
