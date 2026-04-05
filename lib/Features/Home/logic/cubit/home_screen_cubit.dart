import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Home/data/repos/home_screen_repo.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final HomeScreenRepo homeScreenRepo;
  HomeScreenCubit({required this.homeScreenRepo})
    : super(HomeScreenState.intial());
  Future<void> loadTours() async {
    final cachedTours = homeScreenRepo.getCachedTours();
    if (cachedTours != null) {
      emit(
        HomeScreenState.toursLoaded(
          toursResponse: cachedTours,
          isFromCache: true,
          refreshing: true,
        ),
      );
      await refreshTours(cachedTours);
    } else {
      emit(HomeScreenState.toursLoading());
      final remoteTours = await homeScreenRepo.refreshTours();
      remoteTours.when(
        success: (toursResponse) {
          emit(
            HomeScreenState.toursLoaded(
              toursResponse: toursResponse,
              isFromCache: false,
              refreshing: false,
            ),
          );
        },
        failure: (error) {
          emit(HomeScreenState.error(error.message));
        },
      );
    }
  }

  Future<void> refreshTours(ToursResponse cachedTours) async {
    final response = await homeScreenRepo.refreshTours();
    response.when(
      success: (toursResponse) {
        emit(
          HomeScreenState.toursLoaded(
            toursResponse: toursResponse,
            isFromCache: false,
            refreshing: false,
          ),
        );
      },
      failure: (error) {
        emit(
          HomeScreenState.toursLoaded(
            toursResponse: cachedTours,
            isFromCache: true,
            refreshing: false,
            refreshErrorMessage: error.message,
          ),
        );
      },
    );
  }
}
