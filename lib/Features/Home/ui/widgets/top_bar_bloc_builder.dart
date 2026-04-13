import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Home/ui/widgets/top_bar_shimmer.dart';
import 'package:natours_application/Features/Home/ui/widgets/topbar_row.dart';
import 'package:natours_application/Features/Profile/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/Features/Profile/logic/cubit/user_response_state.dart';

class TopBarBlocBuilder extends StatelessWidget {
  const TopBarBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserResponseCubit, UserResponseState>(
      buildWhen: (previous, current) {
        return current is UserLoading ||
            current is UserSuccess ||
            current is UserError;
      },
      builder: (context, state) {
        return state.maybeWhen(
          userLoading: () {
            return TopBarShimmer();
          },
          userSuccess: (user) {
            return TopbarRow(user: user);
          },
          userError: (message) {
            return SizedBox.shrink();
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }
}
