import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/core/Theming/colors.dart';

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
                        style: TextStyle(
                          color: ColorsManager.darkBlue,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' / person',
                        style: TextStyle(
                          color: ColorsManager.grey,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$stops stops included',
                  style: TextStyle(
                    color: ColorsManager.lightGrey,
                    fontSize: 12.sp,
                  ),
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
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
