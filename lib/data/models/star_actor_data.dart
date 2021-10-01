import 'dart:convert';

import '../../domain/entities/entities.dart';

class StarActorModel extends StarActor {
  const StarActorModel({
    required id,
    required name,
  }) : super(id: id, name: name);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory StarActorModel.fromMap(Map<String, dynamic> map) {
    return StarActorModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StarActorModel.fromJson(String source) =>
      StarActorModel.fromMap(json.decode(source));
}
