import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/detail_stars.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/Features/Details/ui/widgets/tour_detail_title.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';

class QuickFactsSection extends StatelessWidget {
  final String nextDate;
  final String difficulty;
  final int participants;
  final int duration;
  final double rating;
  final int reviews;

  const QuickFactsSection({
    super.key,
    required this.nextDate,
    required this.difficulty,
    required this.participants,
    required this.duration,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      child: Column(
        children: [
          Row(
            children: [
              const TourDetailTitle('Quick Facts'),
              const Spacer(),
              DetailStars(rating: rating.round(), size: 13),
              horizontalSpace(4),
              Text(
                '${rating.toStringAsFixed(1)}  ($reviews reviews)',
                style: TextStyle(
                  color: ColorsManager.darkBlue,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          verticalSpace(14),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 2.45,
            children: [
              _FactTile(
                icon: Icons.calendar_today_outlined,
                label: 'Next Date',
                value: nextDate,
              ),
              _FactTile(
                icon: Icons.bolt_outlined,
                label: 'Difficulty',
                value: _capitalized(difficulty),
              ),
              _FactTile(
                icon: Icons.people_outline,
                label: 'Participants',
                value: '$participants people',
              ),
              _FactTile(
                icon: Icons.schedule_outlined,
                label: 'Duration',
                value: '$duration days',
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _capitalized(String value) {
    if (value.isEmpty) return value;
    return '${value[0].toUpperCase()}${value.substring(1).toLowerCase()}';
  }
}

class _FactTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _FactTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: ColorsManager.gray100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: ColorsManager.mainGreen, size: 14.r),
              horizontalSpace(6),
              Flexible(
                child: Text(
                  label.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ColorsManager.grey,
                    fontSize: 10.sp,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(5),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: ColorsManager.darkBlue, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
