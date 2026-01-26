import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Routing/app_router.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/Theming/colors.dart';

class NatoursApp extends StatelessWidget {
  final AppRouter router;
  const NatoursApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        onGenerateRoute: router.generateRoute,
        initialRoute: Routes.onboardingScreen,
        theme: ThemeData(
          primaryColor: ColorsManager.mainGreen,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
