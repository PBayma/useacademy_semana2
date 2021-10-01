import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/datasources/movie_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/usecases/get_movie.dart';
import 'domain/usecases/get_movies_list.dart';
import 'infra/http/http_adapter.dart';
import 'presentation/presenters/stream_home_presenter.dart';
import 'presentation/presenters/stream_movie_presenter.dart';
import 'ui/components/app_theme.dart';
import 'ui/pages/home/home_page.dart';
import 'ui/pages/movie/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nerdflix',
      theme: AppTheme.lightThemeData,
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          '/': (context) => HomePage(
                presenter: StreamHomePresenter(
                  getMoviesList: GetMoviesList(
                    repository: MovieRepositoryImpl(
                      movieDataSource: MovieDataSourceImpl(
                        client: HttpAdapter(
                          client: Client(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          '/movie': (context) => MoviePage(
                presenter: StreamMoviePresenter(
                  getMovie: GetMovie(
                    repository: MovieRepositoryImpl(
                      movieDataSource: MovieDataSourceImpl(
                        client: HttpAdapter(
                          client: Client(),
                        ),
                      ),
                    ),
                  ),
                ),
                movieId: settings.arguments as String,
              ),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
