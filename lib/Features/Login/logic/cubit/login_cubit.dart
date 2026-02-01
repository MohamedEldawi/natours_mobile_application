import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Login/data/models/login_request_body.dart';
import 'package:natours_application/Features/Login/data/repos/login_repo.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());
    final response = await loginRepo.login(loginRequestBody);
    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(error));
      },
    );
  }
}
