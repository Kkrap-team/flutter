import 'package:dio/dio.dart';
import 'package:krap/config/config.dart';
import 'package:krap/core/http/custom_log_interceptor.dart';

class HttpClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // TODO JWT 도입 시 TokenInterceptor 추가
    var tokenInterceptor = InterceptorsWrapper(
      onRequest: (option, handler) {
        return handler.next(option);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    );

    dio.interceptors.add(tokenInterceptor);
    dio.interceptors.add(CustomLogInterceptor());

    return dio;
  }
}
