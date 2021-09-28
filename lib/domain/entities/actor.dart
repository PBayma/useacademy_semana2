import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final String id;
  final String image;
  final String name;

  const Actor({
    required this.id,
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [id, image, name];
}
