import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/dto/Folder.dart';
import 'package:krap/provider/client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folders_provider.g.dart';

@riverpod
Future<List<Folder>> folders(Ref ref, int id) async {
  final repo = ref.watch(userRepoProvider);
  return repo.getUser(id);
}
