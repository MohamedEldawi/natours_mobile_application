import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Home/logic/cubit/home_screen_cubit.dart';
import 'package:natours_application/Features/Home/logic/cubit/home_screen_state.dart';
import 'package:natours_application/Features/Home/ui/widgets/shimmer_loading.dart';
import 'package:natours_application/Features/Home/ui/widgets/tours_list.dart';

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
            return Center(child: Text(message));
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
