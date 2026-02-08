import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Home/ui/widgets/home_screen_bloc_builder.dart';
import 'package:natours_application/Features/Home/ui/widgets/topbar_row.dart';
import 'package:natours_application/core/Helpers/spaces.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            width: double.infinity,
            child: Column(
              children: [
                TopbarRow(),
                verticalSpace(20),
                Container(color: Colors.white, child: HomeScreenBlocBuilder()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
