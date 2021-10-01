import '../../../domain/entities/entities.dart';

abstract class MoviePresenter {
  Stream<Movie> get movieStream;
  Stream<String> get errorStream;

  Future<void> loadMovie(String movieId);
}
