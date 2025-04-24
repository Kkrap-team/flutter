import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/provider/dio_provider.dart';
import 'package:krap/repository/http/http_client.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  final dio = ref.watch(dioProvider);
  return HttpClient(dio);
});

