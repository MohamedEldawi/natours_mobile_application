import 'package:flutter/material.dart';
import 'package:natours_application/core/Theming/styles.dart';

class TourDetailTitle extends StatelessWidget {
  final String title;

  const TourDetailTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.font16DarkBlue500Weight,
    );
  }
}
