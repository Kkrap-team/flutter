import 'package:dio/dio.dart';
import 'package:krap/feature/main/dto/create_folder_request.dart';
import 'package:krap/feature/main/dto/create_folder_response.dart';
import 'package:retrofit/retrofit.dart';

part 'folder_api.g.dart';

@RestApi()
abstract class FolderApi {
  factory FolderApi(Dio dio) = _FolderApi;

  @POST('/folders/{userId}')
  Future<CreateFolderResponse> createFolder(
    @Path('userId') int userId,
    @Body() CreateFolderRequest createFolderRequest,
  );
}
