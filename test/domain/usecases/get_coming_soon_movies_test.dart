import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:useacademy_semana2/core/error/failures.dart';
import 'package:useacademy_semana2/core/usecases/usecase.dart';
import 'package:useacademy_semana2/data/models/models.dart';
import 'package:useacademy_semana2/domain/entities/entities.dart';
import 'package:useacademy_semana2/domain/repositories/movie_repository.dart';
import 'package:useacademy_semana2/domain/usecases/get_coming_soon_movies.dart';

import 'get_movies_list_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late GetComingSoonMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetComingSoonMovies(repository: mockMovieRepository);
  });

  const tActorList = [
    ActorModel(id: '1', image: 'html://image.com', name: 'John Karter'),
    ActorModel(id: '1', image: 'html://image.com', name: 'John Clovan'),
  ];
  const tStarActorList = [
    StarActorModel(id: '1', name: 'John Karter'),
    StarActorModel(id: '2', name: 'John Clovan'),
  ];

  const tMoviesList = [
    Movie(
      id: '1',
      title: 'Lost',
      image: 'html://lost.image.com',
      plot: 'Filme show',
      actorList: tActorList,
      starList: tStarActorList,
    ),
    Movie(
      id: '2',
      title: 'Baby Driver',
      image: 'html://babydriver.image.com',
      plot: 'Filme show demais',
      actorList: tActorList,
      starList: tStarActorList,
    )
  ];
  test('should get coming soon movies from repository', () async {
    when(mockMovieRepository.getMoviesComingSoon())
        .thenAnswer((_) async => const Right(tMoviesList));

    final result = await usecase(NoParams());

    expect(result, equals(const Right(tMoviesList)));
  });

  test('should get a failure from repository ', () async {
    // arrange
    when(mockMovieRepository.getMoviesComingSoon())
        .thenAnswer((_) async => Left(ServerFailure()));

    //act
    final result = await usecase(NoParams());

    //assert
    expect(result, equals(Left(ServerFailure())));
  });
}
