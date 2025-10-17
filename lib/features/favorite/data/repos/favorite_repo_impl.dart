import 'package:pet_finder/features/pets_home/data/models/pets.dart';

import '../../../../core/service/hive/hive_database.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final HiveDatabase db = HiveDatabase();

  FavoriteRepoImpl();

  @override
  Future<void> addAndRemoveFavorite(Pets pet) async {
    if (db.petsBox == null) return;
    final exitingKey = db.petsBox!.keys.firstWhere(
      (key) => db.petsBox!.get(key)!.id == pet.id,
      orElse: () => null,
    );

    if (exitingKey != null) {
      await db.petsBox!.delete(exitingKey);
    } else {
      await db.petsBox!.add(pet);
    }
  }

  @override
  Future<List<Pets>> getFavoritePets() async {
    if (db.petsBox == null) return [];
    return db.petsBox!.values.toList();
  }

  @override
  bool isFavorite(String petId) {
    if (db.petsBox == null) return false;
    return db.petsBox!.values.any((pet) => pet.id == petId);
  }
}
