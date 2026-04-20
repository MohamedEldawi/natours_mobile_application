import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Theming/styles.dart';

class TourImageAndText extends StatelessWidget {
  const TourImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha: 0)],
              begin: AlignmentGeometry.bottomCenter,
              end: AlignmentGeometry.topCenter,
              stops: [0.18, 0.4],
            ),
          ),
          child: Image.asset('assets/images/onboarding_image.png'),
        ),
        Positioned(
          bottom: 30.h,
          left: 25.h,
          right: 25.h,
          child: Text(
            textAlign: TextAlign.center,
            'Best Tour Regestration App',
            style: TextStyles.font32Green700Weight,
          ),
        ),
      ],
    );
  }
}
