import 'package:dio/dio.dart';
import 'package:krap/dto/folder.dart';
import 'package:retrofit/retrofit.dart';

part 'folder_api.g.dart';

@RestApi()
abstract class FolderApi {
  factory FolderApi(Dio dio, {String baseUrl}) = _FolderApi;

  @GET('/folders/{userId}')
  Future<List<Folder>> getFolders(@Path('userId') int userId);
}
