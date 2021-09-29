import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:useacademy_semana2/core/error/exceptions.dart';
import 'package:useacademy_semana2/core/error/failures.dart';
import 'package:useacademy_semana2/data/datasources/movie_data_source.dart';
import 'package:useacademy_semana2/data/models/models.dart';
import 'package:useacademy_semana2/data/repositories/movie_repository_impl.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([MovieDataSource])
void main() {
  late MockMovieDataSource mockDataSource;
  late MovieRepositoryImpl repositoryImpl;

  setUp(() {
    mockDataSource = MockMovieDataSource();
    repositoryImpl = MovieRepositoryImpl(movieDataSource: mockDataSource);
  });

  const tActorList = [
    ActorModel(id: '1', image: 'html://image.com', name: 'John Karter'),
    ActorModel(id: '1', image: 'html://image.com', name: 'John Karter'),
  ];

  const tSecondMovie = MovieModel(
    id: '2',
    title: 'Baby Driver',
    image: 'https://imdb.image',
    plot: 'Assalto ao banco',
    actorList: tActorList,
  );

  const tMovie = MovieModel(
    id: '1',
    title: 'Lost',
    image: 'https://imdb.image',
    plot: 'Pessoal se perdeu em uma ilha',
    actorList: tActorList,
  );

  const tMovieId = '1';
  const tMovieType = 'dramas';

  group('movie repository impl', () {
    test('should get the right valid movie passing the movie id', () async {
      // arrange
      when(mockDataSource.getMovie(any))
          .thenAnswer((realInvocation) async => tMovie);

      //act
      final result = await repositoryImpl.getMovie(tMovieId);

      //assert
      expect(result, equals(const Right(tMovie)));
    });

    test(
        'should return a left value with server failure, when the request throws a exception',
        () async {
      // arrange
      when(mockDataSource.getMovie(any)).thenThrow(ServerException());

      //act
      final result = await repositoryImpl.getMovie(tMovieId);

      //assert
      expect(result, equals(Left(ServerFailure())));
    });

    test(
        'should return a right value with a movie list, when the request is sucess',
        () async {
      // arrange
      final movieList = [tMovie, tSecondMovie];

      when(mockDataSource.getMoviesList(any))
          .thenAnswer((_) async => movieList);

      //act
      final result = await repositoryImpl.getMoviesList(tMovieType);

      //assert
      expect(result, equals(Right(movieList)));
    });

    test(
        'should return a left value with server failure, when the request of the list throws a exception',
        () async {
      // arrange
      when(mockDataSource.getMoviesList(any)).thenThrow(ServerException());

      //act
      final result = await repositoryImpl.getMoviesList(tMovieType);

      //assert
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
