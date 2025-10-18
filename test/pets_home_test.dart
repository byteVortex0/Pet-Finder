import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder/core/common/logic/generic_state.dart';
import 'package:pet_finder/core/service/api/api_service.dart';
import 'package:pet_finder/core/service/api/error/api_result.dart';
import 'package:pet_finder/core/service/api/error/error_model.dart';
import 'package:pet_finder/features/pets_home/data/models/pets.dart';
import 'package:pet_finder/features/pets_home/data/repos/get_all_pets_repo.dart';
import 'package:pet_finder/features/pets_home/logic/get_all_pets_cubit.dart';

class MockApiService extends Mock implements ApiService {}

class MockGetAllPetsRepo extends Mock implements GetAllPetsRepo {}

void main() {
  late MockApiService mockApiService;
  late MockGetAllPetsRepo repo;
  late GetAllPetsCubit cubit;

  setUp(() {
    mockApiService = MockApiService();
    repo = MockGetAllPetsRepo();
    cubit = GetAllPetsCubit(repo);
  });

  final petsList = <Pets>[
    Pets(
      id: '1',
      name: 'Cat',
      referenceImageId: 'ref1',
      description: 'cute',
      origin: 'egypt',
      lifeSpan: '10 years',
      weight: Weight(imperial: '4 - 6', metric: '2 - 3'),
    ),
  ];

  group('GetAllPetsRepo', () {
    test('returns Success when apiService.getAllPets succeeds', () async {
      final limit = 10;
      final page = 1;

      when(
        () => mockApiService.getAllPets(limit, page),
      ).thenAnswer((_) async => petsList);

      final result = await repo.getAllPets(limit, page);

      expect(result, isA<Success<List<Pets>>>());
      final success = result as Success<List<Pets>>;
      expect(success.data, petsList);
      verify(() => mockApiService.getAllPets(limit, page)).called(1);
    });

    test('returns Failure when apiService.getAllPets throws', () async {
      final limit = 5;
      final page = 2;

      when(
        () => mockApiService.getAllPets(limit, page),
      ).thenThrow(Exception('network error'));

      final result = await repo.getAllPets(limit, page);

      expect(result, isA<Failure>());

      verify(() => mockApiService.getAllPets(limit, page)).called(1);
    });
  });

  group('GetAllPetsCubit', () {
    blocTest<GetAllPetsCubit, GenericState<List<Pets>>>(
      'emits [loading, success] when repo returns Success with data',
      build: () {
        when(
          () => repo.getAllPets(any(), any()),
        ).thenAnswer((_) async => Success(petsList));
        return cubit;
      },
      act: (cubit) async => await cubit.getAllPets(limit: 10, page: 1),
      expect: () => [
        GenericState<List<Pets>>.loading(),
        GenericState<List<Pets>>.success(petsList),
      ],
      verify: (_) {
        verify(() => repo.getAllPets(10, 1)).called(1);
      },
    );

    blocTest<GetAllPetsCubit, GenericState<List<Pets>>>(
      'emits [loading, empty] when repo returns Success with empty list',
      build: () {
        when(
          () => repo.getAllPets(any(), any()),
        ).thenAnswer((_) async => Success([]));
        return cubit;
      },
      act: (cubit) async => await cubit.getAllPets(),
      expect: () => [
        GenericState<List<Pets>>.loading(),
        GenericState<List<Pets>>.empty(),
      ],
    );

    blocTest<GetAllPetsCubit, GenericState<List<Pets>>>(
      'emits [loading, error] when repo returns Failure',
      build: () {
        when(() => repo.getAllPets(any(), any())).thenAnswer(
          (_) async => Failure(ErrorModel(message: 'Network error')),
        );
        return cubit;
      },
      act: (cubit) async => await cubit.getAllPets(),
      expect: () => [
        GenericState<List<Pets>>.loading(),
        GenericState<List<Pets>>.error('Network error'),
      ],
    );
  });
}
