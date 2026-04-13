import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Signup/logic/cubit/signup_cubit.dart';
import 'package:natours_application/Features/Signup/logic/cubit/signup_state.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) {
        return current is Success || current is Error;
      },
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            showSuccessDialouge(context);
          },
          error: (error) {
            setupErrorState(error, context);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  void showSuccessDialouge(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Signup Successful'),
          content: Text('Congratulations, you have signed up successfully!'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorsManager.mainGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              },
              child: Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(String error, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(Icons.error, color: Colors.red, size: 32),
          content: Text(error, style: TextStyles.font15DarkBlue500Weight),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Got it', style: TextStyles.font13MainGreen600Weight),
            ),
          ],
        );
      },
    );
  }
}
