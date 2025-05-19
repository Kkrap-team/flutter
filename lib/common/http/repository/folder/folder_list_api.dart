import 'package:dio/dio.dart';
import 'package:krap/common/http/dto/folder.dart';
import 'package:retrofit/retrofit.dart';

part 'folder_list_api.g.dart';

@RestApi()
abstract class FolderListApi {
  factory FolderListApi(Dio dio) = _FolderListApi;

  @GET('/folders/{userId}')
  Future<List<Folder>> getFolderList(@Path('userId') int userId);
}
