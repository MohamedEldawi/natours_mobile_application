import 'package:flutter/material.dart';
import 'package:natours_application/core/Theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font13Grey400Weight,
          ),
          TextSpan(
            text: 'Terms & conditions ',
            style: TextStyles.font13DarkBlue500Weight,
          ),
          TextSpan(text: 'and ', style: TextStyles.font13Grey400Weight),
          TextSpan(
            text: 'PrivacyPolicy',
            style: TextStyles.font13DarkBlue500Weight,
          ),
        ],
      ),
    );
  }
}
