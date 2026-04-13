import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Home/logic/cubit/home_screen_cubit.dart';
import 'package:natours_application/Features/Home/logic/cubit/home_screen_state.dart';
import 'package:natours_application/Features/Home/ui/widgets/shimmer_loading.dart';
import 'package:natours_application/Features/Home/ui/widgets/tours_list.dart';
import 'package:natours_application/Features/Profile/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/core/Theming/colors.dart';

class HomeScreenBlocBuilder extends StatelessWidget {
  const HomeScreenBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      buildWhen: (previous, current) {
        return current is ToursLoading || current is Loaded || current is Error;
      },
      builder: (context, state) {
        return state.maybeWhen(
          toursLoading: () {
            return ShimmerLoading();
          },
          toursLoaded:
              (toursResponse, isFromCache, refreshing, refreshErrorMessage) {
                final List<TourModel>? tours = toursResponse.data?.tours;
                if (!refreshing && refreshErrorMessage != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showSnackBar(context, refreshErrorMessage);
                  });
                }
                return Column(
                  children: [
                    if (refreshing) const LinearProgressIndicator(),
                    ToursList(tours: tours ?? []),
                  ],
                );
              },
          error: (message) {
            return setupError(message, context);
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupError(String errorMessage, BuildContext context) {
    return SizedBox(
      height: 700.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.mainGreen,
              ),
              onPressed: () {
                context.read<UserResponseCubit>().loadUserInLoginSuccess();
                context.read<HomeScreenCubit>().loadTours();
              },
              child: Text('Retry', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
