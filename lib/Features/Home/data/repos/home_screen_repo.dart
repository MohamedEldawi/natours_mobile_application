import 'package:dio/dio.dart';
import 'package:natours_application/Features/Home/data/models/tours_response.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/error_model.dart';

class HomeScreenRepo {
  final ApiService _apiService;
  HomeScreenRepo({required ApiService apiService}) : _apiService = apiService;
  Future<ApiResult<ToursResponse>> getAllTours() async {
    try {
      final response = await _apiService.getAllTours();
      return ApiResult.success(response);
    } on DioException catch (e) {
      final ErrorModel error = ErrorModel.fromJson(e.response?.data);
      return ApiResult.failure(error.message!);
    }
  }
}
