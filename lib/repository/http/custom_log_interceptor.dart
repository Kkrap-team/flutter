import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:krap/util/app_logger.dart';
import 'package:krap/util/util.dart';

class CustomLogInterceptor extends LogInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      AppLogger.i('[REQUEST] => ${options.method} ${options.uri}');
      AppLogger.d('Headers: ${options.headers}');
      if (options.data != null) {
        AppLogger.d('Body:\n${Util.convertJsonToString(options.data)}');
      }
      super.onRequest(options, handler);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      AppLogger.e('[ERROR] => ${err.message}');
      if (err.response != null) {
        AppLogger.w('Response:\n${Util.convertJsonToString(err.response?.data)}');
      }
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      AppLogger.i(
        '[RESPONSE] => ${response.statusCode} ${response.requestOptions.uri}',
      );
      AppLogger.d('Data:\n${Util.convertJsonToString(response.data)}');
      super.onResponse(response, handler);
    }
  }

}
