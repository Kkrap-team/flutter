import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/provider/api_provider.dart';
import 'package:krap/repository/folder/folder_repository.dart';

final folderRepoProvider = Provider<FolderRepository>((ref) {
  final client = ref.watch(folderApiProvider);
  return FolderRepository(client);
});
