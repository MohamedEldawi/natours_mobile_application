import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/Home/data/repos/home_screen_repo.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final HomeScreenRepo homeScreenRepo;
  HomeScreenCubit({required this.homeScreenRepo})
    : super(HomeScreenState.intial());
  Future<void> emitHomeScreenStates() async {
    emit(HomeScreenState.toursLoading());
    final response = await homeScreenRepo.getAllTours();
    response.when(
      success: (toursResponse) {
        emit(HomeScreenState.toursSuccess(toursResponse));
      },
      failure: (error) {
        emit(HomeScreenState.toursError(error.message));
      },
    );
  }
}
