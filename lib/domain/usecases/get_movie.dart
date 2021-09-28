import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovie implements UseCase<Movie, Params> {
  final MovieRepository repository;

  GetMovie({required this.repository});

  @override
  Future<Either<Failure, Movie>>? call(Params params) async {
    return await repository.getMovie(params.movieId);
  }
}

class Params extends Equatable {
  final String movieId;

  const Params({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
