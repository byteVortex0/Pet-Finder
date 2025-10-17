import 'package:get_it/get_it.dart';
import 'package:pet_finder/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:pet_finder/features/pets_home/data/repos/get_all_pets_repo.dart';
import 'package:pet_finder/features/pets_home/logic/get_all_pets_cubit.dart';

import '../../features/favorite/data/repos/favorite_repo.dart';
import '../../features/favorite/logic/cubit/favorite_cubit.dart';
import '../../features/home/logic/home_nav_cubit.dart';
import '../service/api/api_service.dart';

import '../service/api/dio_factory.dart';

GetIt sl = GetIt.instance;

void setupInjection() {
  _initCore();
  _home();
  _homePets();
  _favorites();
}

void _initCore() {
  final dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));
}

void _home() {
  //Cubits
  sl.registerFactory<HomeNavCubit>(() => HomeNavCubit());
}

void _homePets() {
  //Repos
  sl.registerLazySingleton<GetAllPetsRepo>(() => GetAllPetsRepo(sl()));

  //Cubits
  sl.registerFactory<GetAllPetsCubit>(() => GetAllPetsCubit(sl()));
}

void _favorites() {
  //Repos
  sl.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl());

  //Cubits
  sl.registerFactory<FavoriteCubit>(() => FavoriteCubit(sl()));
}
