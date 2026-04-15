import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/Features/Details/ui/widgets/tour_detail_title.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';

class AboutTourSection extends StatelessWidget {
  final String description;

  const AboutTourSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TourDetailTitle('About this Tour'),
          verticalSpace(12),
          Text(
            description,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorsManager.grey,
              fontSize: 14.sp,
              height: 1.6,
            ),
          ),
          verticalSpace(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Read more',
                style: TextStyle(
                  color: ColorsManager.mainGreen,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              horizontalSpace(2),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18.r,
                color: ColorsManager.mainGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
