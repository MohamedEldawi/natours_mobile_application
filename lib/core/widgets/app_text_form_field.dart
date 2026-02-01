import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabeledBorder;
  final String hint;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final Color? backgroundColor;
  final bool? obscureText;
  final Widget? suffixIcons;
  final TextEditingController? controller;
  final Function(String? value) validator;
  const AppTextFormField({
    this.contentPadding,
    this.focusedBorder,
    this.enabeledBorder,
    required this.hint,
    this.hintStyle,
    this.inputTextStyle,
    this.obscureText,
    this.suffixIcons,
    this.backgroundColor,
    this.controller,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        enabledBorder:
            enabeledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.lighterGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.mainGreen,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hint,
        hintStyle: hintStyle ?? TextStyles.font14LightGrey400Weight,
        filled: true,
        fillColor: backgroundColor ?? ColorsManager.moreLighterGrey,
        suffixIcon: suffixIcons,
      ),
      obscureText: obscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DarkBlue500Weight,
      cursorColor: ColorsManager.darkBlue,
      cursorHeight: 15.h,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
