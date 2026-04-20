import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_network_image.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class SliverDetailsAppBar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final String difficulty;
  final int duration;
  final String tourId;
  const SliverDetailsAppBar({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.difficulty,
    required this.duration,
    required this.tourId,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorsManager.gray100,
      expandedHeight: 365.h,
      scrolledUnderElevation: 0,
      elevation: 0,
      pinned: true,
      stretch: true,
      centerTitle: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constrains) {
          final bool isCollabsed = constrains.maxHeight <= kToolbarHeight + 75;
          return FlexibleSpaceBar(
            titlePadding: isCollabsed ? null : EdgeInsets.zero,
            expandedTitleScale: 1.0,
            background: Hero(
              tag: tourId,
              child: DetailsNetworkImage(imageUrl: imageUrl),
            ),
            centerTitle: false,
            title: isCollabsed
                ? _titleName(isCollabsed)
                : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.3, 0.5, 0.95, 1.0],
                        colors: [
                          ColorsManager.black.withAlpha(80),
                          ColorsManager.black.withAlpha(90),
                          ColorsManager.black.withAlpha(100),
                          ColorsManager.black.withAlpha(0),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          verticalSpace(10.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: ColorsManager.mainGreen,
                                size: 15.r,
                              ),
                              horizontalSpace(5),
                              Flexible(
                                child: Text(
                                  location,
                                  style: TextStyles.font13MainGreen400Weight,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(6),
                          _titleName(isCollabsed),
                          verticalSpace(8),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 3.h,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorsManager.mainGreen,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  '${_capitalized(difficulty)} Tour',
                                  style: TextStyles.font12White400Weight,
                                ),
                              ),
                              horizontalSpace(12),
                              Text(
                                '$duration Days',
                                style: TextStyles.font13White400Weight.copyWith(
                                  color: ColorsManager.white.withValues(
                                    alpha: 0.85,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(10.h),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  String _capitalized(String value) {
    if (value.isEmpty) return value;
    return '${value[0].toUpperCase()}${value.substring(1).toLowerCase()}';
  }

  Text _titleName(bool isCollabsed) {
    return Text(
      name,
      style: isCollabsed
          ? TextStyles.font18Black700Weight
          : TextStyles.font24White500Weight,
      maxLines: isCollabsed ? 1 : 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
