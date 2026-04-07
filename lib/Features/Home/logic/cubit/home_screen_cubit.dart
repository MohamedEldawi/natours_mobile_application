import 'package:flutter_bloc/flutter_bloc.dart';
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
      await refreshTours();
      return;
    }
    emit(HomeScreenState.toursLoading());
    await refreshTours();
  }

  Future<void> refreshTours() async {
    final currentLoadedState = _loadedState;
    if (currentLoadedState != null && !currentLoadedState.refreshing) {
      emit(
        currentLoadedState.copyWith(
          refreshing: true,
          refreshErrorMessage: null,
        ),
      );
    }
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
        if (currentLoadedState != null) {
          emit(
            currentLoadedState.copyWith(
              refreshing: false,
              refreshErrorMessage: error.message,
            ),
          );
        } else {
          emit(HomeScreenState.error(error.message));
        }
      },
    );
  }

  Loaded? get _loadedState => state.maybeMap(
    toursLoaded: (loadedState) => loadedState,
    orElse: () => null,
  );
}
