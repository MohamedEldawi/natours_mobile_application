import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Theming/styles.dart';

class NatoursLogoAndName extends StatelessWidget {
  const NatoursLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo-green-small.png',
          height: 30.h,
          width: 40.w,
        ),
        SizedBox(width: 5.w),
        Text('Natours', style: TextStyles.font24Black700Weight),
      ],
    );
  }
}
