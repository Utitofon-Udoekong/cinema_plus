import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:dio/dio.dart';

class RefreshAccessTokenInterceptor extends Interceptor {
  // Inject necessary dependencies
  final String _accessToken;
  final Dio _dio;

  // Constructor to initialize dependencies
  RefreshAccessTokenInterceptor(this._dio, this._accessToken);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
  
    options.headers['requires-token'] = 'true';
    options.headers['Accept'] = 'application/json';
    options.headers['Authorization'] = 'Bearer $_accessToken';
    options.queryParameters.addAll({'api_key': AppStrings.apiKey});
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 (Unauthorized) responses globally
    if (err.response?.statusCode == 401) {
      // Attempt to refresh access token if possible
      // var accessToken = await _cacheManager.loadAccessToken;
      try {
        // handler.resolve(await _retry(err.requestOptions));
        err.requestOptions.headers['Authorization'] = 'Bearer $_accessToken';
        // Retry the request with the refreshed token
        handler.resolve(await _dio.fetch(err.requestOptions));
      } on DioException catch (e) {
        handler.next(e);
      }
      return;
    }

    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}
