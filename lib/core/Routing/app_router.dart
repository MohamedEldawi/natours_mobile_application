import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Home/home_screen.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_cubit.dart';
import 'package:natours_application/Features/Login/ui/login_screen.dart';
import 'package:natours_application/Features/Onboarding/onboarding_screen.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for: ${settings.name}")),
          ),
        );
    }
  }
}
