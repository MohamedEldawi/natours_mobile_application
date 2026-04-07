import 'package:dio/dio.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/Helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;
  static Dio getDio() {
    Duration timeOut = Duration(seconds: 10);
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.sendTimeout = timeOut
        ..options.connectTimeout = timeOut;
      addDioInterceptor();
      addDioHeaders();
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

  static void addDioHeaders() async {
    _dio?.options.headers = {
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken)}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers = {'Authorization': 'Bearer $token'};
  }
}
