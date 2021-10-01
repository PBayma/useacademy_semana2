import 'package:flutter_test/flutter_test.dart';
import 'package:useacademy_semana2/data/models/star_actor_data.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tstarActorModel = StarActorModel(
    id: '1',
    name: 'John Wick',
  );
  group('fromJson', () {
    test('should return a valid star actor', () async {
      final result = StarActorModel.fromJson(fixture('actor.json'));

      expect(result, equals(tstarActorModel));
    });
    test('should return a valid star actor when some atribute is null',
        () async {
      const tstarActorModelWithNull = StarActorModel(
        id: '',
        name: 'John Wick',
      );

      final result = StarActorModel.fromJson(fixture('actorWithNull.json'));

      expect(result, equals(tstarActorModelWithNull));
    });
  });

  group(
    'toJson',
    () {
      test(
        'should return a valid star actor',
        () async {
          //act
          final result = tstarActorModel.toJson();

          //assert
          expect(result, equals('{"id":"1","name":"John Wick"}'));
        },
      );
    },
  );
}
