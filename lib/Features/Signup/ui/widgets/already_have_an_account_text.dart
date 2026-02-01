import 'package:flutter/material.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:flutter/gestures.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyles.font13DarkBlue400Weight,
          ),
          TextSpan(
            text: 'Log In',
            style: TextStyles.font13MainGreen600Weight,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
