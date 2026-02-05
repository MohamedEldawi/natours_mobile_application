import 'package:flutter/material.dart';
import 'package:natours_application/Features/Home/ui/widgets/tour_card.dart';
import 'package:natours_application/core/Helpers/spaces.dart';

class ToursList extends StatelessWidget {
  const ToursList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return verticalSpace(30);
      },
      itemCount: 10,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return TourCard();
      },
    );
  }
}
