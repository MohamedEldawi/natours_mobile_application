import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:natours_application/Features/User/data/models/user.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:natours_application/core/networking/api_constants.dart';
import 'package:shimmer/shimmer.dart';

class TopbarRow extends StatelessWidget {
  final User user;
  const TopbarRow({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${user.name!.split(' ').first.toUpperCase()}!',
              style: TextStyles.font18DarkBlue700weight,
            ),
            Text('How Are You Today?', style: TextStyles.font11Grey400weight),
          ],
        ),
        Spacer(),
        CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) {
            return Shimmer.fromColors(
              baseColor: ColorsManager.lightGrey,
              highlightColor: Colors.white,
              child: CircleAvatar(radius: 24, backgroundColor: Colors.white),
            );
          },
          imageUrl: '${ApiConstants.baseUsersImageUrl}${user.photo}',
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(radius: 24, backgroundImage: imageProvider);
          },
        ),
      ],
    );
  }
}
