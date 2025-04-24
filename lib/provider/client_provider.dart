import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/provider/dio_provider.dart';
import 'package:krap/repository/http/HttpClient.dart';
import 'package:krap/repository/http/FolderRepository.dart';

final HttpClientProvider = Provider<HttpClient>((ref) {
  final dio = ref.watch(dioProvider);
  return HttpClient(dio);
});

final userRepoProvider = Provider<FolderRepository>((ref) {
  final client = ref.watch(HttpClientProvider);
  return FolderRepository(client);
});
