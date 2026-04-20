import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/Features/Details/ui/widgets/tour_detail_title.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class AboutTourSection extends StatefulWidget {
  final String description;

  const AboutTourSection({super.key, required this.description});

  @override
  State<AboutTourSection> createState() => _AboutTourSectionState();
}

class _AboutTourSectionState extends State<AboutTourSection> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TourDetailTitle('About this Tour'),
          verticalSpace(12),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: Text(
              widget.description,
              maxLines: isCollapsed ? 6 : null,
              overflow: isCollapsed ? TextOverflow.ellipsis : null,
              style: TextStyles.font14Grey400Weight.copyWith(height: 1.6),
            ),
          ),
          verticalSpace(8),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isCollapsed ? 'Read more' : 'Show less',
                  style: TextStyles.font14MainGreen500Weight,
                ),
                horizontalSpace(2),
                Icon(
                  isCollapsed
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  size: 18.r,
                  color: ColorsManager.mainGreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
