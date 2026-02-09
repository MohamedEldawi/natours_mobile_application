import 'package:dio/dio.dart';
import 'package:natours_application/Features/Signup/data/models/signup_request_body.dart';
import 'package:natours_application/Features/Signup/data/models/signup_response_body.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/error_handler.dart';
import 'package:natours_application/core/networking/error_model.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo({required ApiService apiService}) : _apiService = apiService;
  Future<ApiResult<SignupResponseBody>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } on DioException catch (e) {
      final ErrorModel apiError = ErrorHandler.handleApiError(e);
      return ApiResult.failure(apiError.message!);
    }
  }
}
