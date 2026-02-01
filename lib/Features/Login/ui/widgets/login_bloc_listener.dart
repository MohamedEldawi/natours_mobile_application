import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_cubit.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_state.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return current is Loading || current is Success || current is Error;
      },
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainGreen,
                  ),
                );
              },
            );
          },
          success: (data) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: Icon(Icons.error, color: Colors.red, size: 32),
                  content: Text(
                    error,
                    style: TextStyles.font15DarkBlue500Weight,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Got it',
                        style: TextStyles.font13MainGreen600Weight,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
