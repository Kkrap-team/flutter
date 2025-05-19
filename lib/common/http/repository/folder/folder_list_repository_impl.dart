import 'package:krap/common/http/dto/folder.dart';
import 'package:krap/common/http/repository/folder/folder_list_api.dart';
import 'package:krap/common/http/repository/folder/folder_list_repository.dart';

class FolderListRepositoryImpl implements FolderListRepository {
  final FolderListApi api;

  FolderListRepositoryImpl(this.api);

  @override
  Future<List<Folder>> getFolderList(int userId) {
    return api.getFolderList(userId);
  }
}
