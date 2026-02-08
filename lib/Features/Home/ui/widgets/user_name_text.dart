import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_state.dart';
import 'package:natours_application/core/Theming/colors.dart';
import 'package:natours_application/core/Theming/styles.dart';
import 'package:shimmer/shimmer.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = context.select<UserResponseCubit, String?>(
      (cubit) => cubit.state.maybeWhen(
        userSuccess: (user) => user.data!.name,
        orElse: () => null,
      ),
    );
    final loading = context.select<UserResponseCubit, bool>(
      (cubit) =>
          cubit.state.maybeWhen(userLoading: () => true, orElse: () => false),
    );
    if (loading) {
      return Shimmer.fromColors(
        baseColor: ColorsManager.lightGrey,
        highlightColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Text(
            'Hi, Mohamed!',
            style: TextStyles.font18DarkBlue700weight,
          ),
        ),
      );
    }
    return Text('Hi, $userName!', style: TextStyles.font18DarkBlue700weight);
  }
}
