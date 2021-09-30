import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:useacademy_semana2/core/error/exceptions.dart';
import 'package:useacademy_semana2/data/datasources/movie_data_source.dart';
import 'package:useacademy_semana2/data/models/models.dart';
import 'package:useacademy_semana2/infra/http/http_adapter.dart';
import 'package:useacademy_semana2/shared/api_url.dart';

import '../../fixtures/fixture_reader.dart';
import 'movie_data_source_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  late MockClient mockClient;
  late HttpAdapter adapter;
  late MovieDataSourceImpl dataSource;

  setUp(() {
    mockClient = MockClient();
    adapter = HttpAdapter(client: mockClient);
    dataSource = MovieDataSourceImpl(client: adapter);
  });

  const String tMovieId = 'tt1375666';

  group('get movie', () {
    final String tBody = fixture('simpleMovieData.json');

    test('should perform a GET request on a URL passing the idMovie', () async {
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(tBody, 200));

      await dataSource.getMovie(tMovieId);

      verify(
        mockClient.get(
          Uri.parse('https://imdb-api.com/pt/API/Title/k_51a2fpgu/tt1375666'),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
          },
        ),
      );
    });

    test('should return response code 200 and get a valid Movie', () async {
      // arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(tBody, 200));
      final tMovieModel = MovieModel.fromJson(tBody);

      //act
      final result = await dataSource.getMovie(tMovieId);

      //assert
      expect(result, equals(tMovieModel));
    });

    test('should throws a ServerException when statusCode is 4xx', () async {
      // arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(tBody, 403));

      //act

      final result = dataSource.getMovie(tMovieId);

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });

    test('should throws a ServerException when statusCode is 5xx', () async {
      // arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(tBody, 500));

      //act

      final result = dataSource.getMovie(tMovieId);

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('get movie list', () {
    final String tBodyList = fixture('listMovies.json');

    test('should perform a GET request on a URL', () async {
      // arrange
      const keyWordTypeMovie = 'dramas';

      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(tBodyList, 200));

      //act
      await dataSource.getMoviesList(keyWordTypeMovie);

      //assert
      verify(
        mockClient.get(
          Uri.parse('https://imdb-api.com/API/Keyword/k_51a2fpgu/dramas'),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
          },
        ),
      );
    });

    test('should return response code 200 and get a valid MovieList', () async {
      // arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(tBodyList, 200));
      final tMovieModel = MovieModel.fromJson(tBodyList);

      //act
      final result = await dataSource.getMovie(tMovieId);

      //assert
      expect(result, equals(tMovieModel));
    });

    test('should throws a ServerException when status code is 4xx', () async {
      // arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(tBodyList, 401));

      //act
      final result = dataSource.getMovie(tMovieId);

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });

    test('should throws a ServerException when status code is 5xx', () async {
      // arrange
      when(mockClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => Response(tBodyList, 500));

      //act
      final result = dataSource.getMovie(tMovieId);

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
