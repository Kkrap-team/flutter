import 'package:krap/feature/home/dto/create_folder_request.dart';
import 'package:krap/feature/home/dto/create_folder_response.dart';

abstract class FolderRepository {
  Future<CreateFolderResponse> createFolder(
    int userId,
    CreateFolderRequest createFolderRequest,
  );
}
