import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_section_card.dart';
import 'package:natours_application/Features/Details/ui/widgets/details_network_image.dart';
import 'package:natours_application/Features/Details/ui/widgets/tour_detail_title.dart';
import 'package:natours_application/Features/Profile/data/models/user.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:natours_application/core/networking/api_constants.dart';

class TourGuidesSection extends StatelessWidget {
  final List<User> guides;

  const TourGuidesSection({super.key, required this.guides});

  @override
  Widget build(BuildContext context) {
    return DetailsSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TourDetailTitle('Tour Guides'),
          verticalSpace(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: guides.map((guide) => _GuideAvatar(guide: guide)).toList(),
          ),
        ],
      ),
    );
  }
}

class _GuideAvatar extends StatelessWidget {
  final User guide;

  const _GuideAvatar({required this.guide});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52.r,
          height: 52.r,
          padding: EdgeInsets.all(_isLeadGuide ? 2.r : 0),
          decoration: BoxDecoration(
            color: ColorsManager.lighterGrey,
            shape: BoxShape.circle,
            border: _isLeadGuide
                ? Border.all(color: ColorsManager.mainGreen, width: 2.r)
                : null,
          ),
          child: ClipOval(
            child: DetailsNetworkImage(
              imageUrl: _imageUrl,
            ),
          ),
        ),
        verticalSpace(6),
        Text(
          guide.name ?? '',
          style: TextStyles.font12DarkBlue400Weight,
        ),
        verticalSpace(2),
        Text(
          _roleText,
          style: TextStyles.font11Grey400weight,
        ),
      ],
    );
  }

  bool get _isLeadGuide => guide.role == 'lead-guide';

  String get _imageUrl {
    final photo = guide.photo ?? '';
    if (photo.isEmpty) return '';
    return '${ApiConstants.baseUsersImageUrl}$photo';
  }

  String get _roleText {
    final role = guide.role ?? '';
    if (role == 'lead-guide') return 'Lead Guide';
    if (role == 'guide') return 'Guide';
    return role;
  }
}
