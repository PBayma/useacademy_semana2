import 'dart:async';

import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie.dart';
import '../../ui/pages/movie/movie_presenter.dart';

class StreamMoviePresenter implements MoviePresenter {
  final GetMovie getMovie;

  StreamMoviePresenter({required this.getMovie});

  final StreamController<Movie> movieStreamController =
      StreamController<Movie>();

  final StreamController<String> errorStreamController =
      StreamController<String>();

  @override
  Stream<Movie> get movieStream => movieStreamController.stream;

  @override
  Stream<String> get errorStream => errorStreamController.stream;

  @override
  Future<void> loadMovie(String movieId) async {
    final movieList = await getMovie.call(Params(movieId: movieId));

    movieList.fold(
      (failure) {
        errorStreamController.add('Erro ao carregar filme');
      },
      (movie) {
        movieStreamController.add(movie);
      },
    );
  }
}
