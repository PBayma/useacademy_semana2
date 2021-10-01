import '../../../domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<List<Movie>> get americaMovieStream;
  Stream<List<Movie>> get arsenalMoviesStream;
  Stream<List<Movie>> get toYouMoviesStream;
  Stream<String> get errorStream;

  Future<void> loadArsenalMovies();
  Future<void> loadAmericaMovies();
  Future<void> loadToYouMovies();
}
