import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_data_source.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl({required this.movieDataSource});

  @override
  Future<Either<Failure, Movie>> getMovie(String movieId) async {
    try {
      return Right(await movieDataSource.getMovie(movieId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesList(String movieType) async {
    try {
      return Right(await movieDataSource.getMoviesList(movieType));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
