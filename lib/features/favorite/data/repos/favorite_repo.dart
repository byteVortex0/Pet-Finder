import '../../../pets_home/data/models/pets.dart';

abstract class FavoriteRepo {
  Future<void> addAndRemoveFavorite(Pets pet);

  Future<List<Pets>> getFavoritePets();

  bool isFavorite(String petId);
}
