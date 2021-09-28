import 'package:flutter_test/flutter_test.dart';
import 'package:useacademy_semana2/data/models/models.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tMovieModel = MovieModel(
    id: 'tt14561924',
    title: 'Ourselves',
    image: 'https://imdb-api.com/images.jpg',
    plot: '',
    actorList: [],
  );
  test('should return a valid movie when some camps are null', () async {
    final result = MovieModel.fromJson(fixture('simpleMovieData.json'));

    expect(result, equals(tMovieModel));
  });

  test('should return a valid movie', () async {
    // arrange
    const tMovieModelComplete = MovieModel(
      id: 'tt1375666',
      title: 'Inception',
      image:
          'https://imdb-api.com/images/original/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6762_AL_.jpg',
      plot: 'Filme show',
      actorList: [
        ActorModel(
          id: 'nm0000138',
          image: 'https://imdb-api.com/images.jpg',
          name: 'Leonardo DiCaprio',
        ),
        ActorModel(
          id: 'nm0330687',
          image: 'https://imdb-api.com/images.jpg',
          name: 'Joseph Gordon-Levitt',
        ),
      ],
    );

    //act
    final result = MovieModel.fromJson(fixture('fullMovieData.json'));

    //assert
    expect(result, equals(tMovieModelComplete));
  });
}
