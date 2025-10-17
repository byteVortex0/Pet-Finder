import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/core/common/logic/generic_state.dart';

import '../../../pets_home/data/models/pets.dart';
import '../../data/repos/favorite_repo.dart';

class FavoriteCubit extends Cubit<GenericState<List<Pets>>> {
  FavoriteCubit(this.repo) : super(GenericState.initial());

  final FavoriteRepo repo;

  Future<void> fetchFavorites() async {
    emit(GenericState.loading());
    try {
      final pets = await repo.getFavoritePets();
      if (pets.isEmpty) {
        emit(GenericState.empty());
      } else {
        emit(GenericState.success(pets));
      }
    } catch (e) {
      emit(GenericState.error('Failed to load favorites'));
    }
  }

  Future<void> addAndRemoveFavorite(Pets pet) async {
    try {
      await repo.addAndRemoveFavorite(pet);
      await fetchFavorites();
    } catch (e) {
      emit(GenericState.error('Failed to add favorite'));
    }
  }

  bool isFavorite(String id) => repo.isFavorite(id);
}
