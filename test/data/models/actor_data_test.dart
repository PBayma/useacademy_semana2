import 'package:flutter_test/flutter_test.dart';
import 'package:useacademy_semana2/data/models/models.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tActorModel = ActorModel(
    id: '1',
    name: 'John Wick',
    image: 'html://jhonwick.image.com',
  );

  group('fromJson', () {
    test('should return a valid actor', () async {
      final result = ActorModel.fromJson(fixture('actor.json'));

      expect(result, equals(tActorModel));
    });
    test('should return a valid actor when some atribute is null', () async {
      const tActorModelWithNull = ActorModel(
        id: '',
        name: 'John Wick',
        image: 'html://jhonwick.image.com',
      );

      final result = ActorModel.fromJson(fixture('actorWithNull.json'));

      expect(result, equals(tActorModelWithNull));
    });
  });

  group('toJson', () {
    test('should return a valid actor', () async {
      //act
      final result = tActorModel.toJson();

      //assert
      expect(
          result,
          equals(
              '{"id":"1","image":"html://jhonwick.image.com","name":"John Wick"}'));
    });
  });
}
