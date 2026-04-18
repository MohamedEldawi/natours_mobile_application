import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:natours_application/Features/Details/ui/widgets/about_tour_section.dart';
import 'package:natours_application/Features/Details/ui/widgets/booking_summary_card.dart';
import 'package:natours_application/Features/Details/ui/widgets/quick_facts_section.dart';
import 'package:natours_application/Features/Details/ui/widgets/reviews_section.dart';
import 'package:natours_application/Features/Details/ui/widgets/sliver_app_bar.dart';
import 'package:natours_application/Features/Details/ui/widgets/tour_gallery_section.dart';
import 'package:natours_application/Features/Details/ui/widgets/tour_guides_section.dart';
import 'package:natours_application/Features/Home/data/models/review.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Profile/data/models/user.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/networking/api_constants.dart';

class DetailsScreen extends StatelessWidget {
  final TourModel? tour;

  const DetailsScreen({super.key, this.tour});

  @override
  Widget build(BuildContext context) {
    final galleryImages = _galleryImages;
    final guides = tour?.guides ?? <User>[];
    final reviews = tour?.reviews ?? <Review>[];
    final reviewsCount = tour?.ratingsQuantity ?? reviews.length;

    return Scaffold(
      backgroundColor: ColorsManager.gray100,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverDetailsAppBar(
              tourId: tour?.id ?? '',
              imageUrl: _tourImageUrl(tour?.imageCover),
              name: tour?.name ?? '',
              location: tour?.startLocation?.description ?? '',
              difficulty: tour?.difficulty ?? '',
              duration: tour?.duration ?? 0,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    verticalSpace(24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          QuickFactsSection(
                            nextDate: _formattedNextDate,
                            difficulty: tour?.difficulty ?? '',
                            participants: tour?.maxGroupSize ?? 0,
                            duration: tour?.duration ?? 0,
                            rating: tour?.ratingsAverage ?? 0,
                            reviews: reviewsCount,
                          ),
                          TourGuidesSection(guides: guides),
                          AboutTourSection(
                            description: tour?.description ?? '',
                          ),
                          TourGallerySection(imageUrls: galleryImages),
                          ReviewsSection(
                            rating: tour?.ratingsAverage ?? 0,
                            reviewsCount: reviewsCount,
                            reviews: reviews,
                          ),
                          BookingSummaryCard(
                            price: tour?.price ?? 0,
                            stops: tour?.startDates?.length ?? 0,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  List<String> get _galleryImages {
    final images = tour?.images ?? [];
    return images
        .where((image) => image.isNotEmpty)
        .map(_tourImageUrl)
        .take(3)
        .toList();
  }

  String get _formattedNextDate {
    final nextDate = tour?.startDates?.isNotEmpty == true
        ? tour!.startDates!.first
        : null;
    if (nextDate == null) return '';

    try {
      return DateFormat('MMM d, yyyy').format(DateTime.parse(nextDate));
    } catch (_) {
      return nextDate;
    }
  }

  String _tourImageUrl(String? imageName) {
    final image = imageName ?? '';
    if (image.isEmpty) return '';
    return '${ApiConstants.baseToursImageUrl}$image';
  }
}
