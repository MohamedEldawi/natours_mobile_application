import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Signup/data/models/signup_request_body.dart';
import 'package:natours_application/Features/Signup/data/repos/signup_repo.dart';
import 'package:natours_application/Features/Signup/logic/cubit/signup_state.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:flutter/material.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  SignupCubit({required this.signupRepo}) : super(const SignupState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  void emitSinupStates() async {
    emit(SignupState.loading());
    final response = await signupRepo.signup(
      SignupRequestBody(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        passwordConfirm: passwordConfirmController.text,
      ),
    );
    response.when(
      success: (data) {
        emit(SignupState.success(data));
      },
      failure: (error) {
        emit(SignupState.error(error.message));
      },
    );
  }
}
