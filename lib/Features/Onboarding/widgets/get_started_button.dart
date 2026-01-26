import 'package:flutter/material.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 52),
        backgroundColor: ColorsManager.mainGreen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text('Get Started', style: TextStyles.font16White500Weight),
    );
  }
}
