import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/core/http/http_client.dart';

final dioProvider = Provider<Dio>((ref) {
  return HttpClient.create(); // ✅ 설정은 내부, DI는 외부
});
