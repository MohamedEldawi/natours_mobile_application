import 'package:dio/dio.dart';
import 'package:natours_application/core/networking/api_constants.dart';
import 'package:natours_application/core/networking/error_model.dart';

class ErrorHandler {
  static ErrorModel handleApiError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ErrorModel(message: 'Connection to server failed');
        case DioExceptionType.cancel:
          return ErrorModel(message: 'Request to the server was cancelled');
        case DioExceptionType.connectionTimeout:
          return ErrorModel(message: 'Connection timeout with the server');
        case DioExceptionType.receiveTimeout:
          return ErrorModel(
            message: 'Receive time out in connection with the server',
          );
        case DioExceptionType.sendTimeout:
          return ErrorModel(
            message: 'Send time out in connection with the server',
          );
        case DioExceptionType.badResponse:
          if (error.response!.statusCode == 401) {
            return ErrorModel(message: ApiConstants.unauthorizedMessage);
          }
          return ErrorModel.fromJson(error.response?.data);
        default:
          return ErrorModel(message: 'Something Went Wrong');
      }
    } else {
      return ErrorModel(message: 'Unknown Error Occured');
    }
  }
}
