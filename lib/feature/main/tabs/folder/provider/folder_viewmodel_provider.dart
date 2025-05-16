import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/provider/dio_provider.dart';
import 'package:krap/feature/main/tabs/folder/repository/folder_api.dart';
import 'package:krap/feature/main/tabs/folder/repository/folder_repository.dart';
import 'package:krap/feature/main/tabs/folder/repository/folder_repository_impl.dart';
import 'package:krap/feature/main/tabs/folder/usecase/create_folder_usecase.dart';
import 'package:krap/feature/main/tabs/folder/viewmodel/folder_viewmodel.dart';

final folderApiProvider = Provider<FolderApi>((ref) {
  final dio = ref.watch(dioProvider);
  return FolderApi(dio);
});

final folderRepositoryProvider = Provider<FolderRepository>((ref) {
  final folderApi = ref.watch(folderApiProvider);
  return FolderRepositoryImpl(folderApi);
});

final folderViewModelProvider = AsyncNotifierProvider<FolderViewModel, void>(
  FolderViewModel.new,
);

final createFolderUsecaseProvider = Provider<CreateFolderUsecase>((ref) {
  final repo = ref.watch(folderRepositoryProvider);
  return CreateFolderUsecase(repo);
});
