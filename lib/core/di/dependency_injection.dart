import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:natours_application/Features/Login/data/repos/login_repo.dart';
import 'package:natours_application/Features/Login/logic/cubit/login_cubit.dart';
import 'package:natours_application/core/networking/api_service.dart';
import 'package:natours_application/core/networking/dio_factory.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(loginRepo: getIt<LoginRepo>()),
  );
}
