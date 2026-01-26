import 'package:flutter/material.dart';
import 'package:natours_application/Features/Login/login_screen.dart';
import 'package:natours_application/Features/Onboarding/onboarding_screen.dart';
import 'package:natours_application/core/Routing/routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for: ${settings.name}")),
          ),
        );
    }
  }
}
