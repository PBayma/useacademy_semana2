import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:useacademy_semana2/core/error/failures.dart';
import 'package:useacademy_semana2/data/models/models.dart';
import 'package:useacademy_semana2/data/models/star_actor_data.dart';
import 'package:useacademy_semana2/domain/entities/entities.dart';
import 'package:useacademy_semana2/domain/entities/movie.dart';
import 'package:useacademy_semana2/domain/repositories/movie_repository.dart';
import 'package:useacademy_semana2/domain/usecases/get_movie.dart';

import 'get_movie_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late GetMovie usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetMovie(repository: mockMovieRepository);
  });

  const tActorList = [
    ActorModel(id: '1', image: 'html://image.com', name: 'John Karter'),
    ActorModel(id: '1', image: 'html://image.com', name: 'John Karter'),
  ];
  const tStarActorList = [
    StarActorModel(id: '1', name: 'John Karter'),
    StarActorModel(id: '2', name: 'John Clovan'),
  ];

  const testMovie = Movie(
    id: '1',
    title: 'Lost',
    image: 'html://lost.image.com',
    plot: 'Filme massa',
    actorList: tActorList,
    starList: tStarActorList,
  );

  test('should get a movie from the movie repository', () async {
    when(mockMovieRepository.getMovie(any))
        .thenAnswer((_) async => const Right(testMovie));

    final result = await usecase(const Params(movieId: '1'));

    expect(result, equals(const Right(testMovie)));
  });

  test('should get a failure from repository', () async {
    // arrange
    when(mockMovieRepository.getMovie(any))
        .thenAnswer((_) async => Left(ServerFailure()));

    //act
    final result = await usecase(const Params(movieId: '5'));

    //assert
    expect(result, equals(Left(ServerFailure())));
  });
}
