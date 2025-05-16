import 'package:krap/feature/main/dto/create_folder_request.dart';
import 'package:krap/feature/main/dto/create_folder_response.dart';

abstract class FolderRepository {
  Future<CreateFolderResponse> createFolder(
    int userId,
    CreateFolderRequest createFolderRequest,
  );
}
