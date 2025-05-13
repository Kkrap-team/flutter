import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/home/dto/create_folder_request.dart';
import 'package:krap/feature/home/tabs/folder/provider/folder_viewmodel_provider.dart';
import 'package:krap/feature/home/tabs/folder/usecase/create_folder_usecase.dart';

class FolderViewModel extends AsyncNotifier<void> {
  late final CreateFolderUsecase _createFolderUsecase;

  @override
  FutureOr<void> build() {
    final _repo = ref.read(folderRepositoryProvider);
    _createFolderUsecase = CreateFolderUsecase(_repo);
  }

  Future<void> createFolder(
    int userId,
    CreateFolderRequest createFolderRequest,
  ) async {
    try {
      state = const AsyncValue.loading();

      _createFolderUsecase.excute(userId, createFolderRequest);

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      AppLogger.e('++createFolder() error = $error, stackTrace = $stackTrace');
    }
  }
}
