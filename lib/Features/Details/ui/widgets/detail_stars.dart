import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Theming/colors.dart';

class DetailStars extends StatelessWidget {
  final int rating;
  final double size;

  const DetailStars({super.key, required this.rating, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final isFilled = index < rating;
        return Icon(
          isFilled ? Icons.star : Icons.star_border,
          size: size.r,
          color: isFilled ? ColorsManager.mainGreen : ColorsManager.lightGrey,
        );
      }),
    );
  }
}
