import 'package:dio/dio.dart';
import 'package:natours_application/Features/Login/data/models/login_request_body.dart';
import 'package:natours_application/Features/Login/data/models/login_response_body.dart';
import 'package:natours_application/core/networking/api_failure.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/error_handler.dart';
import 'package:natours_application/core/networking/error_model.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo({required ApiService apiService}) : _apiService = apiService;
  Future<ApiResult<LoginResponseBody>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } on DioException catch (e) {
      final ApiFailure apiError = ErrorHandler.handleApiError(e);
      return ApiResult.failure(apiError);
    }
  }
}
