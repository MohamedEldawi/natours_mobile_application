import 'package:flutter/material.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Home/ui/widgets/tour_card.dart';
import 'package:natours_application/core/Helpers/spaces.dart';

class ToursList extends StatelessWidget {
  final List<TourModel> tours;
  const ToursList({super.key, required this.tours});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return verticalSpace(30);
      },
      itemCount: tours.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return TourCard(tour: tours[index]);
      },
    );
  }
}
