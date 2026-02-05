import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Home/ui/widgets/tour_card_footer.dart';
import 'package:natours_application/Features/Home/ui/widgets/tour_card_image_and_name.dart';
import 'package:natours_application/Features/Home/ui/widgets/tour_card_info_and_summary.dart';

class TourCard extends StatelessWidget {
  const TourCard({super.key});

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
            image: 'assets/images/tour-2-1.jpeg',
            tourName: "THE MOUNTAIN BIKER",
          ),
          TourCardInfoAndSummary(
            difficulty: "MEDIUM",
            duaration: 10,
            summary:
                'Breathing in Nature in America\'s most spectacular National Parks',
            startLocation: 'Las Vegas, USA',
            startDate: 'March 2027',
            maxGroupSize: 15,
            stops: 4,
          ),
          TourCardFooter(price: 497, rating: '4.8', ratingsNumber: 6),
        ],
      ),
    );
  }
}
