import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/main/dto/create_folder_request.dart';
import 'package:krap/feature/main/dto/create_folder_response.dart';
import 'package:krap/feature/main/tabs/folder/repository/folder_repository.dart';

class CreateFolderUsecase {
  CreateFolderUsecase(this._repo);

  final FolderRepository _repo;

  Future<CreateFolderResponse> excute(
    int userId,
    CreateFolderRequest createFolderRequest,
  ) async {
    AppLogger.d(
      '++CreateFolderUsecase userId = $userId, createFolderRequest = ${createFolderRequest.toJson()}',
    );
    final response = await _repo.createFolder(userId, createFolderRequest);
    AppLogger.d('++CreateFolderUsecase response = ${response.toJson()}');
    return response;
  }
}
