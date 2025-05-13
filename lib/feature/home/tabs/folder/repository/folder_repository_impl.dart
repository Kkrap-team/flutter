import 'package:krap/feature/home/dto/create_folder_request.dart';
import 'package:krap/feature/home/dto/create_folder_response.dart';
import 'package:krap/feature/home/tabs/folder/repository/folder_api.dart';
import 'package:krap/feature/home/tabs/folder/repository/folder_repository.dart';

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
