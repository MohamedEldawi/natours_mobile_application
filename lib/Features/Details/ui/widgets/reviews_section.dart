import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/detail_stars.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_network_image.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/Features/Details/ui/widgets/tour_detail_title.dart';
import 'package:natours_application/Features/Home/data/models/review.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:natours_application/core/networking/api_constants.dart';

class ReviewsSection extends StatelessWidget {
  final double rating;
  final int reviewsCount;
  final List<Review> reviews;

  const ReviewsSection({
    super.key,
    required this.rating,
    required this.reviewsCount,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      child: Column(
        children: [
          Row(
            children: [
              const TourDetailTitle('Reviews'),
              const Spacer(),
              Icon(Icons.star, color: ColorsManager.mainGreen, size: 13.r),
              horizontalSpace(4),
              Text(
                '${rating.toStringAsFixed(1)} - $reviewsCount reviews',
                style: TextStyles.font12DarkBlue400Weight,
              ),
            ],
          ),
          verticalSpace(14),
          ...reviews.map((review) {
            final isLast = review == reviews.last;
            return _ReviewItem(review: review, showDivider: !isLast);
          }),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final Review review;
  final bool showDivider;

  const _ReviewItem({required this.review, required this.showDivider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: showDivider ? 14.h : 0),
      margin: EdgeInsets.only(bottom: showDivider ? 14.h : 0),
      decoration: BoxDecoration(
        border: showDivider
            ? Border(bottom: BorderSide(color: ColorsManager.gray100))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 38.r,
                  height: 38.r,
                  child: DetailsNetworkImage(imageUrl: _imageUrl),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            review.user.name ?? '',
                            style: TextStyles.font14DarkBlue400Weight,
                          ),
                        ),
                        DetailStars(rating: review.rating.round()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(8),
          Text(
            review.review,
            style: TextStyles.font13Grey400Weight.copyWith(height: 1.55),
          ),
        ],
      ),
    );
  }

  String get _imageUrl {
    final photo = review.user.photo ?? '';
    if (photo.isEmpty) return '';
    return '${ApiConstants.baseUsersImageUrl}$photo';
  }
}
