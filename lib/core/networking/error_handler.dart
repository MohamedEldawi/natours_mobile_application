import 'package:dio/dio.dart';
import 'package:natours_application/core/networking/api_failure.dart';
import 'package:natours_application/core/networking/error_model.dart';

class ErrorHandler {
  static const String _defaultErrorMessage = 'Something went wrong';

  static ApiFailure handleApiError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiFailure(
            errorData: ErrorModel(message: 'Connection to server failed'),
            message: 'Connection to server failed',
          );
        case DioExceptionType.cancel:
          return ApiFailure(
            errorData: ErrorModel(
              message: 'Request to the server was cancelled',
            ),
            message: 'Request to the server was cancelled',
          );
        case DioExceptionType.connectionTimeout:
          return ApiFailure(
            errorData: ErrorModel(
              message: 'Connection timeout with the server',
            ),
            message: 'Connection timeout with the server',
          );
        case DioExceptionType.receiveTimeout:
          return ApiFailure(
            errorData: ErrorModel(
              message: 'Receive time out in connection with the server',
            ),
            message: 'Receive time out in connection with the server',
          );
        case DioExceptionType.sendTimeout:
          return ApiFailure(
            errorData: ErrorModel(
              message: 'Send time out in connection with the server',
            ),
            message: 'Send time out in connection with the server',
          );
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final responseData = error.response?.data;

          if (responseData is Map<String, dynamic>) {
            final parsedError = ErrorModel.fromJson(responseData);
            return ApiFailure(
              errorData: parsedError,
              message: parsedError.message ?? _defaultErrorMessage,
              statusCode: statusCode,
            );
          }

          if (responseData is String && responseData.isNotEmpty) {
            return ApiFailure(
              errorData: ErrorModel(message: responseData),
              message: responseData,
              statusCode: statusCode,
            );
          }

          return ApiFailure(
            errorData: ErrorModel(message: _defaultErrorMessage),
            message: _defaultErrorMessage,
            statusCode: statusCode,
          );

        default:
          return ApiFailure(
            errorData: ErrorModel(message: _defaultErrorMessage),
            message: _defaultErrorMessage,
          );
      }
    } else {
      return ApiFailure(
        errorData: ErrorModel(message: 'Unknown Error Occured'),
        message: 'Unknown Error Occured',
      );
    }
  }
}
