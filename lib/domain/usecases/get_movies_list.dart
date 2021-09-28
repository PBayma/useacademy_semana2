import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMoviesList implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  GetMoviesList({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>>? call(NoParams params) async {
    return await repository.getMoviesList();
  }
}

class Params extends Equatable {
  final String movieId;

  const Params({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
