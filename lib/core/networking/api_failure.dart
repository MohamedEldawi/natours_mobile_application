import 'package:natours_application/core/networking/error_model.dart';

class ApiFailure {
  final ErrorModel errorData;
  final String message;
  final int? statusCode;
  ApiFailure({
    required this.errorData,
    required this.message,
    this.statusCode,
  });
}
