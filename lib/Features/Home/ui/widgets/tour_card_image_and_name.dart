import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:shimmer/shimmer.dart';

class TourCardImageAndName extends StatelessWidget {
  final String image;
  final String tourName;
  final String tourId;
  const TourCardImageAndName({
    super.key,
    required this.image,
    required this.tourName,
    required this.tourId,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Hero(
        tag: tourId,
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) {
            return Shimmer.fromColors(
              baseColor: ColorsManager.lightGrey,
              highlightColor: Colors.white,
              child: Container(width: double.infinity, color: Colors.white),
            );
          },
          imageUrl: image,
          imageBuilder: (context, imageProvider) {
            return Stack(
              children: [
                ClipPath(
                  clipper: BottomCurve(),
                  child: Container(
                    width: double.infinity,
                    foregroundDecoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.5),
                    ),
                    child: Image(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 5,
                  child: buildTourName(tourName: tourName),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildTourName({required String tourName}) {
    TextStyle style = TextStyles.font15White300Weight;
    double maxWidth = 100.w;
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      maxLines: 2,
      text: TextSpan(text: tourName, style: style),
    )..layout(maxWidth: maxWidth);
    List<LineMetrics> lines = textPainter.computeLineMetrics();
    if (lines.length == 1) {
      return tourNameContainer(tourName: tourName, style: style);
    }
    List<String> words = tourName.split(' ');
    String firstLine = '';
    String secondLine = '';
    for (String word in words) {
      String testLine = firstLine.isEmpty ? word : '$firstLine $word';
      TextPainter testTextPainter = TextPainter(
        textDirection: TextDirection.ltr,
        maxLines: 1,
        text: TextSpan(text: testLine, style: style),
      )..layout(maxWidth: maxWidth);
      if (!testTextPainter.didExceedMaxLines) {
        firstLine = testLine;
      } else {
        secondLine = words.sublist(words.indexOf(word)).join(' ');
        break;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        tourNameContainer(tourName: firstLine, style: style),
        verticalSpace(1),
        tourNameContainer(tourName: secondLine, style: style),
      ],
    );
  }

  Widget tourNameContainer({
    required String tourName,
    required TextStyle style,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: 150.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      color: Colors.green.withValues(alpha: 0.8),
      child: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        tourName,
        style: style,
      ),
    );
  }
}

class BottomCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height - 20.h);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
