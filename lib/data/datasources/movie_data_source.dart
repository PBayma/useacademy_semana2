import '../../core/error/exceptions.dart';
import '../../shared/api_url.dart';
import '../http/http_client.dart';
import '../models/models.dart';

abstract class MovieDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<MovieModel> getMovie(String movieId);

  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getMoviesList(String keyWordTypeMovie);
}

class MovieDataSourceImpl implements MovieDataSource {
  final HttpClient client;

  MovieDataSourceImpl({required this.client});
  @override
  Future<MovieModel> getMovie(String movieId) async {
    final String url = '$apiMovieUrl$apiToken$movieId';

    try {
      final Map<String, dynamic> response =
          await client.request(url: url, method: 'get');
      return MovieModel.fromMap(response);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMoviesList(String keyWordTypeMovie) async {
    final String url = '$apiListUrl$apiToken$keyWordTypeMovie';

    try {
      final Map<String, dynamic> response =
          await client.request(url: url, method: 'get');
      final moviesList = (response['items'] as List)
          .map((movie) => MovieModel.fromMap(movie))
          .toList();
      return moviesList;
    } catch (e) {
      throw ServerException();
    }
  }
}
