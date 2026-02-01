import 'package:flutter/material.dart';
import 'package:natours_application/core/Theming/styles.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an acoount yet? ',
            style: TextStyles.font13DarkBlue400Weight,
          ),
          TextSpan(text: 'Sign Up', style: TextStyles.font13MainGreen600Weight),
        ],
      ),
    );
  }
}
