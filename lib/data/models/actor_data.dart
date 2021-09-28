import 'dart:convert';

import '../../domain/entities/entities.dart';

class ActorModel extends Actor {
  const ActorModel({
    required String id,
    required String image,
    required String name,
  }) : super(id: id, image: image, name: name);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }

  factory ActorModel.fromMap(Map<String, dynamic> map) {
    return ActorModel(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ActorModel.fromJson(String source) =>
      ActorModel.fromMap(json.decode(source));
}
