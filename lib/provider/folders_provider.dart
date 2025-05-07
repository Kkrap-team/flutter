import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/dto/folder.dart';
import 'package:krap/provider/repo_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folders_provider.g.dart';

@riverpod
Future<List<Folder>> folders(Ref ref, int id) async {
  final repo = ref.watch(folderRepoProvider);
  return repo.getFolders(id);
}
