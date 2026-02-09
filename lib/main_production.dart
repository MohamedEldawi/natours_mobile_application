import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:natours_application/Features/User/data/repos/user_repo.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/Helpers/shared_pref_helper.dart';
import 'package:natours_application/core/Routing/app_router.dart';
import 'package:natours_application/core/di/dependency_injection.dart';
import 'package:natours_application/natours_app.dart';

void main() async {
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
  // await SharedPrefHelper.clearAllSecureDate();
  String userToken = await SharedPrefHelper.getSecureString(
    SharedPrefKeys.userToken,
  );
  if (userToken.isNotEmpty && !(JwtDecoder.isExpired(userToken))) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
    await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
  }
}
