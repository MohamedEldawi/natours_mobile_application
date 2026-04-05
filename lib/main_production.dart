import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/User/data/repos/user_repo.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/Routing/app_router.dart';
import 'package:natours_application/core/di/dependency_injection.dart';
import 'package:natours_application/core/services.dart/user_service.dart';
import 'package:natours_application/natours_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await checkIfUserLoggedIn();
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
