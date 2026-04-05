import 'package:dio/dio.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/Features/Home/data/services/tours_cache_service.dart';
import 'package:natours_application/core/networking/api_failure.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/error_handler.dart';

class HomeScreenRepo {
  final ApiService _apiService;
  final ToursCacheService _cacheService;
  HomeScreenRepo({
    required ApiService apiService,
    required ToursCacheService cacheService,
  }) : _apiService = apiService,
       _cacheService = cacheService;
  Future<ApiResult<ToursResponse>> refreshTours() async {
    try {
      final response = await _apiService.getAllTours();
      await _cacheTours(response);
      return ApiResult.success(response);
    } on DioException catch (e) {
      final ApiFailure error = ErrorHandler.handleApiError(e);
      return ApiResult.failure(error);
    }
  }

  ToursResponse? getCachedTours() {
    return _cacheService.getCachedTours();
  }

  Future<void> _cacheTours(ToursResponse tourResponse) async {
    await _cacheService.cacheTours(tourResponse);
  }
}
