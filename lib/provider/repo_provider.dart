import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/provider/client_provider.dart';
import 'package:krap/repository/http/folder_repository.dart';

final folderRepoProvider = Provider<FolderRepository>((ref) {
  final client = ref.watch(httpClientProvider);
  return FolderRepository(client);
});
