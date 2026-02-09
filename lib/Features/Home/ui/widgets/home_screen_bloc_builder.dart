import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Home/logic/cubit/home_screen_cubit.dart';
import 'package:natours_application/Features/Home/logic/cubit/home_screen_state.dart';
import 'package:natours_application/Features/Home/ui/widgets/shimmer_loading.dart';
import 'package:natours_application/Features/Home/ui/widgets/tours_list.dart';
import 'package:natours_application/Features/User/logic/cubit/user_response_cubit.dart';
import 'package:natours_application/core/Theming/colors.dart';

class HomeScreenBlocBuilder extends StatelessWidget {
  const HomeScreenBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      buildWhen: (previous, current) {
        return current is ToursLoading ||
            current is ToursSuccess ||
            current is ToursError;
      },
      builder: (context, state) {
        return state.maybeWhen(
          toursLoading: () {
            return ShimmerLoading();
          },
          toursSuccess: (toursResponse) {
            final List<TourModel>? tours = toursResponse.data!.tours;
            return ToursList(tours: tours ?? []);
          },
          toursError: (message) {
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
                context.read<HomeScreenCubit>().emitHomeScreenStates();
              },
              child: Text('Retry', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
