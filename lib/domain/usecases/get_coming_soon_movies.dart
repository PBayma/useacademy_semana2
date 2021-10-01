import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/entities.dart';
import '../repositories/movie_repository.dart';

class GetComingSoonMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  GetComingSoonMovies({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams noParams) async {
    return await repository.getMoviesComingSoon();
  }
}
