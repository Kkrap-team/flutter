import 'package:dio/dio.dart';
import 'package:krap/dto/Folder.dart';
import 'package:krap/repository/http/HttpClient.dart';

class FolderRepository {

  FolderRepository(this.client);

  final HttpClient client;

  Future<List<Folder>> getUser(int id) => client.getUser(id);

}
