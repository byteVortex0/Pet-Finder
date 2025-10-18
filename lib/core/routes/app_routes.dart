import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/core/di/injection.dart';
import 'package:pet_finder/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:pet_finder/features/home/logic/home_nav_cubit.dart';
import 'package:pet_finder/features/home/ui/home_screen.dart';
import 'package:pet_finder/features/pets_detials/ui/pets_detials_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/pets_home/data/models/pets.dart';
import '../../features/pets_home/logic/get_all_pets_cubit.dart';
import '../../features/splash/ui/splash_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String home = 'home';
  static const String petsDetails = 'pets_details';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return BaseRoutes(page: SplashScreen());
      case onboarding:
        return BaseRoutes(page: OnboardingScreen());
      case home:
        return BaseRoutes(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<HomeNavCubit>()),
              BlocProvider(
                create: (context) => sl<GetAllPetsCubit>()..getAllPets(),
              ),

              BlocProvider(
                create: (context) => sl<FavoriteCubit>()..fetchFavorites(),
              ),
            ],
            child: HomeScreen(),
          ),
        );
      case petsDetails:
        return BaseRoutes(
          page: BlocProvider(
            create: (context) => sl<FavoriteCubit>(),
            child: PetsDetialsScreen(pet: args as Pets),
          ),
        );
      default:
        return null;
    }
  }
}
