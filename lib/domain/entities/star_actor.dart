import 'package:equatable/equatable.dart';

class StarActor extends Equatable {
  final String id;
  final String name;

  const StarActor({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
