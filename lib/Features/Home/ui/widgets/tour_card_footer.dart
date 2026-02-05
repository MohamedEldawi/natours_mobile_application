import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class TourCardFooter extends StatelessWidget {
  final int price;
  final String rating;
  final int ratingsNumber;
  const TourCardFooter({
    super.key,
    required this.price,
    required this.rating,
    required this.ratingsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        color: ColorsManager.cardFooterGrey,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${price.toString()} ',
                        style: TextStyles.font15DarkBlue700Weight,
                      ),
                      TextSpan(
                        text: 'per person',
                        style: TextStyles.font14Grey400Weight,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$rating ',
                        style: TextStyles.font15DarkBlue700Weight,
                      ),
                      TextSpan(
                        text: 'rating(${ratingsNumber.toString()})',
                        style: TextStyles.font14Grey400Weight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.mainGreen,
              ),
              onPressed: () {},
              child: Text('DETAILS', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
