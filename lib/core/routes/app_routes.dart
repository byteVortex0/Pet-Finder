import 'package:flutter/material.dart';
import 'package:pet_finder/features/home/ui/home_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/splash/ui/splash_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String home = 'home';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return BaseRoutes(page: SplashScreen());
      case onboarding:
        return BaseRoutes(page: OnboardingScreen());
      case home:
        return BaseRoutes(page: HomeScreen());
      default:
        return null;
    }
  }
}
