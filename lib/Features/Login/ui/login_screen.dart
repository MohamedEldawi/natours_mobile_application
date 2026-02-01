import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Login/data/models/login_request_body.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_cubit.dart';
import 'package:natours_application/Features/Login/ui/widgets/already_have_an_account_text.dart';
import 'package:natours_application/Features/Login/ui/widgets/email_and_password.dart';
import 'package:natours_application/Features/Login/ui/widgets/login_bloc_listener.dart';
import 'package:natours_application/Features/Login/ui/widgets/terms_and_conditions_text.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Routing/routes.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/widgets/app_text_button.dart';
import 'package:natours_application/core/widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24MainGreen700Weight,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14Grey400Weight,
                ),
                verticalSpace(36),
                EmailAndPassword(),

                verticalSpace(25),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.font12MainGreen400Weight,
                  ),
                ),
                verticalSpace(41),
                AppTextButton(
                  buttonText: "Login",
                  textStyle: TextStyles.font16White600Weight,
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                ),
                verticalSpace(16),
                TermsAndConditionsText(),
                verticalSpace(60),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: AlreadyHaveAnAccountText(),
                ),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}
