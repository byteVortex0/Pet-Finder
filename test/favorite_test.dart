import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder/core/service/hive/hive_database.dart';
import 'package:pet_finder/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:pet_finder/features/pets_home/data/models/pets.dart';

class MockHiveDatabase extends Mock implements HiveDatabase {}

class MockPetsBox extends Mock implements Box<Pets> {}

void main() {
  late MockHiveDatabase mockHiveDatabase;
  late MockPetsBox mockPetsBox;
  late FavoriteRepoImpl repo;

  final pet = Pets(
    id: '1',
    name: 'Cat',
    referenceImageId: 'ref1',
    description: 'Cute cat',
    origin: 'Egypt',
    lifeSpan: '10 years',
    weight: Weight(imperial: '4 - 6', metric: '2 - 3'),
  );

  setUp(() {
    mockHiveDatabase = MockHiveDatabase();
    mockPetsBox = MockPetsBox();
    when(() => mockHiveDatabase.petsBox).thenReturn(mockPetsBox);
    repo = FavoriteRepoImpl();
    repo.db.petsBox = mockPetsBox;
  });

  group('FavoriteRepoImpl Tests', () {
    test('addAndRemoveFavorite adds pet if not exists', () async {
      when(() => mockPetsBox.keys).thenReturn([]);
      when(() => mockPetsBox.add(pet)).thenAnswer((_) async => 1);

      await repo.addAndRemoveFavorite(pet);

      verify(() => mockPetsBox.add(pet)).called(1);
    });

    test('addAndRemoveFavorite removes pet if already exists', () async {
      when(() => mockPetsBox.keys).thenReturn([1]);
      when(() => mockPetsBox.get(1)).thenReturn(pet);
      when(() => mockPetsBox.delete(1)).thenAnswer((_) async {});

      await repo.addAndRemoveFavorite(pet);

      verify(() => mockPetsBox.delete(1)).called(1);
    });

    test('getFavoritePets returns all pets', () async {
      when(() => mockPetsBox.values).thenReturn([pet]);

      final result = await repo.getFavoritePets();

      expect(result, [pet]);
    });

    test('isFavorite returns true if pet exists', () {
      when(() => mockPetsBox.values).thenReturn([pet]);

      final result = repo.isFavorite('1');

      expect(result, true);
    });

    test('isFavorite returns false if pet does not exist', () {
      when(() => mockPetsBox.values).thenReturn([]);

      final result = repo.isFavorite('99');

      expect(result, false);
    });
  });
}
