import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Details/details_screen.dart';
import 'package:natours_application/Features/Home/data/repos/home_screen_repo.dart';
import 'package:natours_application/Features/Home/logic/cubit/home_screen_cubit.dart';
import 'package:natours_application/Features/Home/ui/screens/home_screen.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_cubit.dart';
import 'package:natours_application/Features/Login/ui/login_screen.dart';
import 'package:natours_application/Features/Onboarding/onboarding_screen.dart';
import 'package:natours_application/Features/Signup/logic/cubit/signup_cubit.dart';
import 'package:natours_application/Features/Signup/ui/signup_screen.dart';
import 'package:natours_application/Features/splash/splash_screen.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HomeScreenCubit(homeScreenRepo: getIt<HomeScreenRepo>())
                  ..loadTours(),
            child: const HomeScreen(),
          ),
        );
      case Routes.detailsScreen:
        return MaterialPageRoute(builder: (context) => const DetailsScreen());
      // default:
      //   return null;
    }
  }
}
