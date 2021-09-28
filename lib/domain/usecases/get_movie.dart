import 'package:equatable/equatable.dart';
import 'package:useacademy_semana2/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:useacademy_semana2/core/usecases/usecase.dart';
import 'package:useacademy_semana2/domain/entities/movie.dart';
import 'package:useacademy_semana2/domain/repositories/movie_repository.dart';

class GetMovie implements UseCase<Movie, Params> {
  final MovieRepository repository;

  GetMovie({required this.repository});

  @override
  Future<Either<Failure, Movie>>? call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class Params extends Equatable {
  final String movieId;

  const Params({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
