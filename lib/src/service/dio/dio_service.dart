
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/service/dio/interceptor.dart';
import 'package:dio/dio.dart';

class DioService {
  DioService();

  final accessToken = AppStrings.acessToken;
  Dio getDio() {
    Dio dio = Dio(BaseOptions(
      baseUrl: AppStrings.baseURL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
    dio.interceptors.addAll([
      RefreshAccessTokenInterceptor(dio, accessToken),
    ]);
    return dio;
  }
}