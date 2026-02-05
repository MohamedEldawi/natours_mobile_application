import 'package:flutter/material.dart';
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
            Text('Hi, Mohamed!', style: TextStyles.font18DarkBlue700weight),
            Text('How Are You Today?', style: TextStyles.font11Grey400weight),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/images/user-default.jpg'),
        ),
      ],
    );
  }
}
