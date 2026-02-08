import 'package:dio/dio.dart';
import 'package:natours_application/Features/User/data/models/user.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/error_model.dart';

class Userrepo {
  final ApiService _apiService;

  Userrepo({required ApiService apiService}) : _apiService = apiService;
  Future<ApiResult<UserResponseModel>> getUser() async {
    try {
      final response = await _apiService.getUserData();
      return ApiResult.success(response);
    } on DioException catch (e) {
      final apiError = ErrorModel.fromJson(e.response!.data);
      return ApiResult.failure(apiError.message!);
    }
  }
}
