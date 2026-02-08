import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Home/ui/widgets/tour_card_footer.dart';
import 'package:natours_application/Features/Home/ui/widgets/tour_card_image_and_name.dart';
import 'package:natours_application/Features/Home/ui/widgets/tour_card_info_and_summary.dart';
import 'package:natours_application/core/networking/api_constants.dart';

class TourCard extends StatelessWidget {
  final TourModel? tour;
  const TourCard({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          TourCardImageAndName(
            image: '${ApiConstants.baseToursImageUrl}${tour!.imageCover}',
            tourName: tour?.name ?? 'name',
          ),
          TourCardInfoAndSummary(
            difficulty: tour?.difficulty ?? '',
            duaration: tour?.duration ?? 0,
            summary: tour?.summary ?? '',
            startLocation: tour?.startLocation!.description ?? '',
            startDate: tour?.startDates![0] ?? '',
            maxGroupSize: tour?.maxGroupSize ?? 0,
            stops: tour?.startDates!.length ?? 0,
          ),
          TourCardFooter(
            price: tour?.price ?? 0,
            rating: tour?.ratingsAverage ?? 0,
            ratingsNumber: tour?.ratingsQuantity ?? 0,
          ),
        ],
      ),
    );
  }
}
