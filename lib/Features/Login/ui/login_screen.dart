import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_cubit.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_state.dart';
import 'package:natours_application/Features/Login/ui/widgets/do_not_have_an_account_text.dart';
import 'package:natours_application/Features/Login/ui/widgets/email_and_password.dart';
import 'package:natours_application/Features/Login/ui/widgets/login_bloc_listener.dart';
import 'package:natours_application/Features/Login/ui/widgets/terms_and_conditions_text.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/widgets/app_text_button.dart';
import 'package:natours_application/core/widgets/key_board_dismiss_wrapper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _messageShown = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_messageShown) return;
    final String? message =
        ModalRoute.of(context)?.settings.arguments as String?;
    if (message != null && message.isNotEmpty) {
      _messageShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyBoardDismissWrapper(
      child: Scaffold(
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
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return AppTextButton(
                        buttonText: "Login",
                        isLoading: state is Loading,
                        textStyle: TextStyles.font16White600Weight,
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      );
                    },
                  ),
                  verticalSpace(16),
                  TermsAndConditionsText(),
                  verticalSpace(60),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: DoNotHaveAnAccountText(),
                  ),
                  LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
