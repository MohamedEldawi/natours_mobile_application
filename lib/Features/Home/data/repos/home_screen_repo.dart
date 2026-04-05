import 'package:dio/dio.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/core/networking/api_failure.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/error_handler.dart';

class HomeScreenRepo {
  final ApiService _apiService;
  HomeScreenRepo({required ApiService apiService}) : _apiService = apiService;
  Future<ApiResult<ToursResponse>> getAllTours() async {
    try {
      final response = await _apiService.getAllTours();
      return ApiResult.success(response);
    } on DioException catch (e) {
      final ApiFailure error = ErrorHandler.handleApiError(e);
      return ApiResult.failure(error);
    }
  }
}
