import 'package:krap/dto/Folder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'client_provider.dart';

part 'user_provider.g.dart';

@riverpod
Future<List<Folder>> user(User Ref ref, int id) async {
  final repo = ref.watch(userRepoProvider);
  return repo.getUser(id);
}
