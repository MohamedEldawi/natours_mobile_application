import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Details/ui/screens/details_screen.dart';
import 'package:natours_application/Features/Details/ui/screens/gallery_screen.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Home/data/repos/home_screen_repo.dart';
import 'package:natours_application/Features/Home/logic/cubit/home_screen_cubit.dart';
import 'package:natours_application/Features/Home/ui/screens/home_screen.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_cubit.dart';
import 'package:natours_application/Features/Login/ui/login_screen.dart';
import 'package:natours_application/Features/Onboarding/onboarding_screen.dart';
import 'package:natours_application/Features/Profile/ui/profile_screen.dart';
import 'package:natours_application/Features/Signup/logic/cubit/signup_cubit.dart';
import 'package:natours_application/Features/Signup/ui/signup_screen.dart';
import 'package:natours_application/Features/payment/logic/cubit/payment_cubit.dart';
import 'package:natours_application/Features/splash/splash_screen.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/di/dependency_injection.dart';

class GalleryScreenArguments {
  final List<String> imageUrls;
  final int initialIndex;

  const GalleryScreenArguments({
    required this.imageUrls,
    required this.initialIndex,
  });
}

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
        final tour = settings.arguments is TourModel
            ? settings.arguments as TourModel
            : null;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<PaymentCubit>(),
            child: DetailsScreen(tour: tour),
          ),
        );
      case Routes.galleryScreen:
        final arguments = settings.arguments;
        final galleryArguments = arguments is GalleryScreenArguments
            ? arguments
            : const GalleryScreenArguments(
                imageUrls: <String>[],
                initialIndex: 0,
              );
        return MaterialPageRoute(
          builder: (context) => GalleryScreen(
            imageUrls: galleryArguments.imageUrls,
            initialIndex: galleryArguments.initialIndex,
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      // default:
      //   return null;
    }
  }
}
