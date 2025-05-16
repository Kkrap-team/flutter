import 'package:krap/feature/main/dto/create_folder_request.dart';
import 'package:krap/feature/main/dto/create_folder_response.dart';
import 'package:krap/feature/main/tabs/folder/repository/folder_api.dart';
import 'package:krap/feature/main/tabs/folder/repository/folder_repository.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderApi api;

  FolderRepositoryImpl(this.api);

  @override
  Future<CreateFolderResponse> createFolder(
    int userId,
    CreateFolderRequest createFolderRequest,
  ) {
    return api.createFolder(userId, createFolderRequest);
  }
}
