import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/repository/http/CustomLogInterceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  // TODO JWT 도입 시 TokenInterceptor 추가
  dio.interceptors.add(CustomLogInterceptor());

  return dio;
});

