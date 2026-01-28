import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Onboarding/widgets/get_started_button.dart';
import 'package:natours_application/Features/Onboarding/widgets/natours_logo_and_name.dart';
import 'package:natours_application/Features/Onboarding/widgets/tour_image_and_text.dart';
import 'package:natours_application/core/Theming/styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 21.h, bottom: 32.h),
            child: Column(
              children: [
                NatoursLogoAndName(),
                TourImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and plan all of your tours easily with Natours to enjoy a whole new travel experience.',
                        style: TextStyles.font11Grey400weight,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.h),
                      GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
