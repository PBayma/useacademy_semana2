import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMoviesList implements UseCase<List<Movie>, MovieListParams> {
  final MovieRepository repository;

  GetMoviesList({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(MovieListParams params) async {
    return await repository.getMoviesList(params.movieType);
  }
}

class MovieListParams extends Equatable {
  final String movieType;

  const MovieListParams({required this.movieType});

  @override
  List<Object> get props => [movieType];
}
