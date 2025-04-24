import 'package:krap/dto/folder.dart';
import 'package:krap/repository/http/http_client.dart';

class FolderRepository {

  FolderRepository(this.client);

  final HttpClient client;

  Future<List<Folder>> getFolders(int id) => client.getFolders(id);
}
