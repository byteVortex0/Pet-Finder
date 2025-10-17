import 'package:hive_flutter/adapters.dart';
import 'package:pet_finder/features/pets_home/data/models/pets.dart';

import '../../../features/favorite/data/models/pets_adapter.dart';

class HiveDatabase {
  HiveDatabase._();

  static final HiveDatabase instance = HiveDatabase._();

  factory HiveDatabase() => instance;

  Box<Pets>? petsBox;
  Box<Weight>? weightBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(PetsAdapter())
      ..registerAdapter(WeightAdapter());

    petsBox = await Hive.openBox<Pets>('petsBox');
    weightBox = await Hive.openBox<Weight>('weightBox');
  }

  Future<void> clearAllBoxs() async {
    await petsBox!.clear();
    await weightBox!.clear();
  }
}
