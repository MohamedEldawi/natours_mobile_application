import 'package:flutter/material.dart';
import 'package:natours_application/Features/Home/ui/widgets/avatar_image.dart';
import 'package:natours_application/Features/Home/ui/widgets/user_name_text.dart';
import 'package:natours_application/core/Theming/styles.dart';

class TopbarRow extends StatelessWidget {
  const TopbarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserNameText(),
            Text('How Are You Today?', style: TextStyles.font11Grey400weight),
          ],
        ),
        Spacer(),
        AvatarImage(),
      ],
    );
  }
}
