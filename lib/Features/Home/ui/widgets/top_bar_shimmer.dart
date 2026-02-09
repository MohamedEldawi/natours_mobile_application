import 'package:flutter/material.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:shimmer/shimmer.dart';

class TopBarShimmer extends StatelessWidget {
  const TopBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: ColorsManager.lightGrey,
          highlightColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Text(
              'Hi, Mohamed!',
              style: TextStyles.font18DarkBlue700weight,
            ),
          ),
        ),
        Spacer(),
        Shimmer.fromColors(
          baseColor: ColorsManager.lightGrey,
          highlightColor: Colors.white,
          child: CircleAvatar(radius: 24, backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
