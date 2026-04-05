import 'package:dio/dio.dart';
import 'package:natours_application/Features/User/data/models/user.dart';
import 'package:natours_application/core/networking/api_failure.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/error_handler.dart';
import 'package:natours_application/core/networking/error_model.dart';

class Userrepo {
  final ApiService _apiService;

  Userrepo({required ApiService apiService}) : _apiService = apiService;
  Future<ApiResult<User>> getUser() async {
    try {
      final response = await _apiService.getUserData();
      return ApiResult.success(response.data!);
    } on DioException catch (e) {
      final ApiFailure apiError = ErrorHandler.handleApiError(e);
      return ApiResult.failure(apiError);
    }
  }
}
