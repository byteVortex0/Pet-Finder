import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/features/pets_home/data/models/pets.dart';
import 'package:pet_finder/features/pets_home/data/repos/get_all_pets_repo.dart';

import '../../../core/common/logic/generic_state.dart';
import '../../../core/service/api/error/api_result.dart';

class GetAllPetsCubit extends Cubit<GenericState<List<Pets>>> {
  GetAllPetsCubit(this.petsRepo) : super((GenericState.initial()));

  final GetAllPetsRepo petsRepo;

  Future<void> getAllPets({int limit = 10, int page = 0}) async {
    emit(GenericState.loading());
    final result = await petsRepo.getAllPets(limit, page);
    if (result is Success<List<Pets>>) {
      if (result.data.isEmpty) {
        emit(GenericState.empty());
      } else {
        emit(GenericState.success(result.data));
      }
    } else if (result is Failure<List<Pets>>) {
      emit(GenericState.error(result.errorModel.displayMessage));
    } else {
      emit(GenericState.error('Unknown error occurred'));
    }
  }
}
