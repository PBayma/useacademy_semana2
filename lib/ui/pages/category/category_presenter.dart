import '../../../domain/entities/entities.dart';

abstract class CategoryPresenter {
  Stream<Movie> get movieStream;
  Stream<String> get errorStream;

  Future<void> loadMovie(String movieId);
}
