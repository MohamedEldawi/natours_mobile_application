import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_network_image.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';

class TourDetailsHero extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final String difficulty;
  final int duration;
  final String tourId;

  const TourDetailsHero({
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
    return SizedBox(
      height: 365.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: tourId,
            child: DetailsNetworkImage(imageUrl: imageUrl),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x33242424), Color(0xB8242424)],
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            left: 16.w,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18.r,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 34.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        style: TextStyle(
                          color: ColorsManager.mainGreen,
                          fontSize: 13.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                verticalSpace(6),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ),
                    horizontalSpace(12),
                    Text(
                      '$duration Days',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: Container(
              height: 24.h,
              decoration: BoxDecoration(
                color: ColorsManager.gray100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
            ),
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
