import 'package:krap/dto/folder.dart';
import 'package:krap/repository/folder/folder_api.dart';

class FolderRepository {

  FolderRepository(this.client);

  final FolderApi client;

  Future<List<Folder>> getFolders(int id) => client.getFolders(id);
}
