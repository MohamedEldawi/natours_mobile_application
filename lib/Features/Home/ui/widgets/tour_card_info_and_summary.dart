import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class TourCardInfoAndSummary extends StatelessWidget {
  final String difficulty;
  final int duaration;
  final String summary;
  final String startLocation;
  final String startDate;
  final int maxGroupSize;
  final int stops;
  const TourCardInfoAndSummary({
    super.key,
    required this.difficulty,
    required this.duaration,
    required this.summary,
    required this.startLocation,
    required this.startDate,
    required this.maxGroupSize,
    required this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: difficulty,
                    style: TextStyles.font18DarkBlue700weight,
                  ),
                  TextSpan(
                    text: '${duaration.toString()}-DAY TOUR',
                    style: TextStyles.font18DarkBlue700weight,
                  ),
                ],
              ),
            ),
            verticalSpace(16),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              summary,
              style: TextStyles.font13Grey400Weight,
            ),
            verticalSpace(16),
            Row(
              children: [
                buildStartLocationAndStopsColumn(
                  startlocation: startLocation,
                  stops: stops,
                ),
                horizontalSpace(20),
                buildDateAndMaxGroupSizeColumn(
                  date: startDate,
                  maxGroupSize: maxGroupSize,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStartLocationAndStopsColumn({
    required String startlocation,
    required int stops,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20.r,
              color: ColorsManager.mainGreen,
            ),
            SizedBox(
              width: 120.w,
              child: Text(
                overflow: TextOverflow.ellipsis,
                startlocation,
                style: TextStyles.font10Grey400Weight,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.flag_outlined,
              size: 20.r,
              color: ColorsManager.mainGreen,
            ),
            Text('$stops stops', style: TextStyles.font10Grey400Weight),
          ],
        ),
      ],
    );
  }

  Widget buildDateAndMaxGroupSizeColumn({
    required String date,
    required int maxGroupSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.date_range_outlined,
              size: 20.r,
              color: ColorsManager.mainGreen,
            ),
            Text(date, style: TextStyles.font10Grey400Weight),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.person_outlined,
              size: 20.r,
              color: ColorsManager.mainGreen,
            ),
            Text('$maxGroupSize people', style: TextStyles.font10Grey400Weight),
          ],
        ),
      ],
    );
  }
}
