import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Signup/logic/cubit/signup_cubit.dart';
import 'package:natours_application/core/Helpers/app_regex.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/widgets/app_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool passwordIsObsecureText = true;
  bool passwordConfirmIsObsecureText = true;
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode passwordConfirmFocusNode;

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    passwordConfirmFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignupCubit>().nameController,
            focusNode: nameFocusNode,
            onSubmitted: (value) {
              emailFocusNode.requestFocus();
            },
            hint: 'name',
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 3) {
                return 'Enter a valid Name';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            focusNode: emailFocusNode,
            onSubmitted: (value) {
              passwordFocusNode.requestFocus();
            },
            hint: 'email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Enter a valid Email';
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            focusNode: passwordFocusNode,
            onSubmitted: (value) {
              passwordConfirmFocusNode.requestFocus();
            },
            hint: 'password',
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 8) {
                return 'Enter a valid Password';
              }
            },
            obscureText: passwordIsObsecureText,
            suffixIcons: GestureDetector(
              onTap: () {
                setState(() {
                  passwordIsObsecureText = !passwordIsObsecureText;
                });
              },
              child: Icon(
                passwordIsObsecureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordConfirmController,
            focusNode: passwordConfirmFocusNode,
            onSubmitted: (value) {
              passwordConfirmFocusNode.unfocus();
            },
            hint: 'confirm password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.length < 8 ||
                  (value !=
                      context.read<SignupCubit>().passwordController.text)) {
                return 'Password didn\'t match';
              }
            },
            obscureText: passwordConfirmIsObsecureText,
            suffixIcons: GestureDetector(
              onTap: () {
                setState(() {
                  passwordConfirmIsObsecureText =
                      !passwordConfirmIsObsecureText;
                });
              },
              child: Icon(
                passwordConfirmIsObsecureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
