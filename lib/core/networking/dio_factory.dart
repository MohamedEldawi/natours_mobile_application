import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;
  static Dio getDio() {
    Duration timeOut = Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.sendTimeout = timeOut
        ..options.connectTimeout = timeOut;
      addDioInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  static void addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }
}
