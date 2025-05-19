import 'package:krap/common/http/dto/folder.dart';

abstract class FolderListRepository {
  Future<List<Folder>> getFolderList(int userId);
}
