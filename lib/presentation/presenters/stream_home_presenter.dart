import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../core/usecases/usecase.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_coming_soon_movies.dart';
import '../../domain/usecases/get_movies_list.dart';
import '../../ui/pages/home/home_presenter.dart';

class StreamHomePresenter implements HomePresenter {
  final GetMoviesList getMoviesList;
  final GetComingSoonMovies getComingSoonMoviesList;

  StreamHomePresenter({
    required this.getMoviesList,
    required this.getComingSoonMoviesList,
  });

  final StreamController<List<Movie>> arsenalMoviesStreamController =
      StreamController<List<Movie>>();

  final StreamController<List<Movie>> americaMoviesStreamController =
      StreamController<List<Movie>>();

  final StreamController<List<Movie>> toYouMoviesStreamController =
      StreamController<List<Movie>>();

  final StreamController<List<Movie>> comingSoonMoviesStreamController =
      StreamController<List<Movie>>();

  final StreamController<String> errorStreamController =
      StreamController<String>();

  @override
  Stream<List<Movie>> get arsenalMoviesStream =>
      arsenalMoviesStreamController.stream;

  @override
  Stream<List<Movie>> get americaMovieStream =>
      americaMoviesStreamController.stream;

  @override
  Stream<List<Movie>> get toYouMoviesStream =>
      toYouMoviesStreamController.stream;

  @override
  Stream<List<Movie>> get comingSoonMoviesStream =>
      comingSoonMoviesStreamController.stream;

  @override
  Stream<String> get errorStream => errorStreamController.stream;

  @override
  Future<void> loadArsenalMovies() async {
    final movieList =
        await getMoviesList.call(const MovieListParams(movieType: 'arsenal'));

    movieList.fold(
      (failure) {
        errorStreamController.add('Erro ao carregar filmes');
      },
      (arsenalMovies) {
        arsenalMoviesStreamController.add(arsenalMovies);
      },
    );
  }

  @override
  Future<void> loadAmericaMovies() async {
    final movieList =
        await getMoviesList.call(const MovieListParams(movieType: 'americana'));

    movieList.fold(
      (failure) {
        debugPrint('$failure');
      },
      (americaMovies) {
        americaMoviesStreamController.add(americaMovies);
      },
    );
  }

  @override
  Future<void> loadToYouMovies() async {
    final movieList =
        await getMoviesList.call(const MovieListParams(movieType: 'ninja'));

    movieList.fold(
      (failure) {
        debugPrint('$failure');
      },
      (toYouMovies) {
        toYouMoviesStreamController.add(toYouMovies);
      },
    );
  }

  @override
  Future<void> comingSoonMovies() async {
    final movieList = await getComingSoonMoviesList.call(NoParams());

    movieList.fold(
      (failure) {
        debugPrint('$failure');
      },
      (comingSoon) {
        comingSoonMoviesStreamController.add(comingSoon);
      },
    );
  }
}
