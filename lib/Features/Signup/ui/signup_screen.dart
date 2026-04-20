import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Login/ui/widgets/terms_and_conditions_text.dart';
import 'package:natours_application/Features/Signup/logic/cubit/signup_cubit.dart';
import 'package:natours_application/Features/Signup/logic/cubit/signup_state.dart';
import 'package:natours_application/Features/Signup/ui/widgets/already_have_an_account_text.dart';
import 'package:natours_application/Features/Signup/ui/widgets/signup_bloc_listener.dart';
import 'package:natours_application/Features/Signup/ui/widgets/signup_form.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:natours_application/core/widgets/app_text_button.dart';
import 'package:natours_application/core/widgets/key_board_dismiss_wrapper.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                    'Create Account',
                    style: TextStyles.font24MainGreen700Weight,
                  ),
                  verticalSpace(8),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: TextStyles.font14Grey400Weight,
                  ),
                  verticalSpace(36),
                  SignupForm(),
                  verticalSpace(41),
                  BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      return AppTextButton(
                        buttonText: 'Create Account',
                        isLoading: state is Loading,
                        textStyle: TextStyles.font16White600Weight,
                        onPressed: () {
                          validateThenDosignup(context);
                        },
                      );
                    },
                  ),
                  verticalSpace(16),
                  TermsAndConditionsText(),
                  verticalSpace(60),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: AlreadyHaveAnAccountText(),
                  ),
                  SignupBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDosignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSinupStates();
    }
  }
}
