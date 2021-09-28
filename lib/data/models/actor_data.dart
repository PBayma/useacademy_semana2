import 'dart:convert';

class ActorModel {
  final String id;
  final String image;
  final String name;
  final String asCharacter;

  ActorModel({
    required this.id,
    required this.image,
    required this.name,
    required this.asCharacter,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'asCharacter': asCharacter,
    };
  }

  factory ActorModel.fromMap(Map<String, dynamic> map) {
    return ActorModel(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      asCharacter: map['asCharacter'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActorModel.fromJson(String source) =>
      ActorModel.fromMap(json.decode(source));
}
