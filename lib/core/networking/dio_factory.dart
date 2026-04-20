import 'package:dio/dio.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/Helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? _dio;
  static Future<Dio> getDio() async {
    Duration timeOut = Duration(seconds: 10);
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.sendTimeout = timeOut
        ..options.connectTimeout = timeOut;
      addDioInterceptor();
      await addDioHeaders();
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

  static Future<void> addDioHeaders() async {
    final token = await SharedPrefHelper.getSecureString(
      SharedPrefKeys.userToken,
    );
    if (token.isEmpty) {
      clearTokenFromHeaderAfterLogout();
      return;
    }
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    if (token.isEmpty) {
      clearTokenFromHeaderAfterLogout();
      return;
    }
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void clearTokenFromHeaderAfterLogout() {
    _dio?.options.headers.remove('Authorization');
  }
}
