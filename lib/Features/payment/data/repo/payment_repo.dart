import 'package:dio/dio.dart';
import 'package:natours_application/Features/payment/data/model/payment_intent_response.dart';
import 'package:natours_application/core/networking/api_failure.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/error_handler.dart';

class PaymentRepo {
  final ApiService _apiService;
  PaymentRepo(this._apiService);
  Future<ApiResult<String>> getClientSecret(String tourId) async {
    try {
      final PaymentIntentResponse response = await _apiService.getClientSecret({
        'tourId': tourId,
      });
      return ApiResult.success(response.clientSecret);
    } on DioException catch (e) {
      final ApiFailure error = ErrorHandler.handleApiError(e);
      return ApiResult.failure(error);
    }
  }
}
