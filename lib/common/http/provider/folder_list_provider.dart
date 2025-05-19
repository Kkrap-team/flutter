import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/http/dto/folder.dart';
import 'package:krap/common/http/provider/dio_provider.dart';
import 'package:krap/common/http/provider/user_provider.dart';
import 'package:krap/common/http/repository/folder/folder_list_api.dart';
import 'package:krap/common/http/repository/folder/folder_list_repository.dart';
import 'package:krap/common/http/repository/folder/folder_list_repository_impl.dart';
import 'package:krap/core/util/app_logger.dart';

final folderListRepositoryProvider = Provider<FolderListRepository>((ref) {
  final folderListApi = ref.watch(folderApiProvider);
  return FolderListRepositoryImpl(folderListApi);
});

final folderApiProvider = Provider<FolderListApi>((ref) {
  final dio = ref.watch(dioProvider);
  return FolderListApi(dio);
});

final folderProvider = AsyncNotifierProvider<_FolderNotifier, List<Folder>?>(
  _FolderNotifier.new,
);

class _FolderNotifier extends AsyncNotifier<List<Folder>?> {
  late final FolderListRepository _repo;

  @override
  Future<List<Folder>?> build() async {
    _repo = ref.watch(folderListRepositoryProvider);

    final user = ref.watch(userProvider).value;
    if (user == null) return null;

    try {
      final response = await _repo.getFolderList(user.userId);
      AppLogger.d(
        '_FolderNotifier build() response = ${response.map((data) => data.toJson())}',
      );
      return response;
    } catch (error, stackTrace) {
      AppLogger.e(
        '_FolderNotifier build() error $error, stackTrace = $stackTrace',
      );
    }

    _repo = ref.watch(folderListRepositoryProvider);
    return null;
  }

  Future<void> fetchFolder(int userId) async {
    state = const AsyncValue.loading();
    try {
      final folderList = await _repo.getFolderList(userId);
      AppLogger.d(
        '++fetchFolder() folders = ${folderList.map((data) => data.toJson())}',
      );
      state = AsyncValue.data(folderList);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
