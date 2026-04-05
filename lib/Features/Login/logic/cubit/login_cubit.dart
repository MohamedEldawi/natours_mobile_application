import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Login/data/models/login_request_body.dart';
import 'package:natours_application/Features/Login/data/repos/login_repo.dart';
import 'package:natours_application/Features/User/data/models/user.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/dio_factory.dart';
import 'package:natours_application/core/services.dart/user_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async {
    emit(LoginState.loading());
    final response = await loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (data) async {
        await UserService().saveUserToken(data.token ?? '');
        final user = data.userData?.user;
        isLoggedIn = true;
        if (user != null) {
          await saveUser(user);
        }
        DioFactory.setTokenIntoHeaderAfterLogin(data.token ?? '');
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(error.message));
      },
    );
  }

  Future<void> saveUser(User user) async {
    await UserService().saveUser(user);
  }
}
