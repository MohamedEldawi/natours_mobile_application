import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Profile/data/repos/user_repo.dart';
import 'package:natours_application/Features/Home/data/services/tours_cache_service.dart';
import 'package:natours_application/Features/Profile/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/Routing/app_router.dart';
import 'package:natours_application/core/di/dependency_injection.dart';
import 'package:natours_application/core/services/hive_service.dart';
import 'package:natours_application/core/services/user_service.dart';
import 'package:natours_application/natours_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await HiveService.initHive();
  await checkIfUserLoggedIn();
  await setupGetIt();
  await getIt<ToursCacheService>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              UserResponseCubit(getIt<Userrepo>())..bootstrap(),
        ),
      ],
      child: NatoursApp(router: AppRouter()),
    ),
  );
}

Future<void> checkIfUserLoggedIn() async {
  final userService = UserService();
  isLoggedIn = await userService.hasValidToken();
  if (isLoggedIn) {
    await userService.restoreCachedUserFromSecureStorage();
  } else {
    await userService.clearUser();
  }
}
