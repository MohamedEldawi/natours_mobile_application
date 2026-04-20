import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Profile/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/Features/Profile/logic/cubit/user_response_state.dart';
import 'package:natours_application/core/Helpers/extensions.dart';
import 'package:natours_application/core/Routing/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocListener<UserResponseCubit, UserResponseState>(
        listener: (context, state) {
          state.whenOrNull(
            userLoggedOut: () {
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (route) => false,
              );
            },
          );
        },
        child: Center(
          child: TextButton(
            onPressed: () {
              context.read<UserResponseCubit>().logout();
            },
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}
