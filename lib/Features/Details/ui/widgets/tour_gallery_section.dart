import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_network_image.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/Features/Details/ui/widgets/tour_detail_title.dart';
import 'package:natours_application/core/Helpers/spaces.dart';

class TourGallerySection extends StatelessWidget {
  final List<String> imageUrls;

  const TourGallerySection({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    final visibleImageUrls = imageUrls.take(3).toList();

    return DetailsSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TourDetailTitle('Tour Gallery'),
          verticalSpace(14),
          Row(
            children: List.generate(visibleImageUrls.length, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == visibleImageUrls.length - 1 ? 0 : 8.w,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      height: 90.h,
                      child: DetailsNetworkImage(
                        imageUrl: visibleImageUrls[index],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
