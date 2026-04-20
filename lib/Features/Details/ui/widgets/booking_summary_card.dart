import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class BookingSummaryCard extends StatelessWidget {
  final double price;
  final int stops;

  const BookingSummaryCard({super.key, required this.price, required this.stops});

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${price.toStringAsFixed(0)}',
                        style: TextStyles.font24DarkBlue500Weight,
                      ),
                      TextSpan(
                        text: ' / person',
                        style: TextStyles.font13Grey400Weight,
                      ),
                    ],
                  ),
                ),
                Text(
                  '$stops stops included',
                  style: TextStyles.font12LightGrey400Weight,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.mainGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 28.w),
              ),
              onPressed: () {},
              child: Text(
                'Book Now',
                style: TextStyles.font14White400Weight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
