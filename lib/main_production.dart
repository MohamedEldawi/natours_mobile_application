import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/Helpers/shared_pref_helper.dart';
import 'package:natours_application/core/Routing/app_router.dart';
import 'package:natours_application/core/di/dependency_injection.dart';
import 'package:natours_application/natours_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await checkIfUserLoggedIn();
  runApp(NatoursApp(router: AppRouter()));
}

Future<void> checkIfUserLoggedIn() async {
  String userToken = await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (userToken.isNotEmpty) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
