import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.intial() = _Initial;
  const factory HomeScreenState.toursLoading() = ToursLoading;
  const factory HomeScreenState.toursLoaded({
    required ToursResponse toursResponse,
    required bool isFromCache,
    required bool refreshing,
    String? refreshErrorMessage,
  }) = Loaded;
  const factory HomeScreenState.error(String message) = Error;
}
