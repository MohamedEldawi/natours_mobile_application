import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Theming/colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final bool isLoading;
  const AppTextButton({
    this.borderRadius,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 16),
        ),
        backgroundColor: backgroundColor ?? ColorsManager.mainGreen,
        minimumSize: Size(
          buttonWidth?.w ?? double.infinity.w,
          buttonHeight?.h ?? 52.h,
        ),
        padding: EdgeInsets.symmetric(vertical: verticalPadding?.h ?? 14.h),
      ),
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(buttonText, style: textStyle),
    );
  }
}
