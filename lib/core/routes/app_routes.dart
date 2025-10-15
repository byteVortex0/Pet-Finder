import 'package:flutter/material.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/splash/ui/splash_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return BaseRoutes(page: SplashScreen());
      case onboarding:
        return BaseRoutes(page: OnboardingScreen());
      default:
        return null;
    }
  }
}
