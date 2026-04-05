import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Home/ui/widgets/home_screen_bloc_builder.dart';
import 'package:natours_application/Features/Home/ui/widgets/top_bar_bloc_builder.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_state.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Helpers/spaces.dart';
import 'package:natours_application/core/Routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserResponseCubit, UserResponseState>(
      listenWhen: (previous, current) => current is UserUnauthorized,
      listener: (context, state) {
        state.whenOrNull(
          userUnauthorized: (message) {
            context.pushNamedAndRemoveUntil(
              Routes.loginScreen,
              predicate: (route) => false,
              arguments: message,
            );
          },
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              width: double.infinity,
              child: Column(
                children: [
                  TopBarBlocBuilder(),
                  verticalSpace(20),
                  Container(
                    color: Colors.white,
                    child: HomeScreenBlocBuilder(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
