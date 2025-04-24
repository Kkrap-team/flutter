import 'package:dio/dio.dart';
import 'package:krap/dto/folder.dart';
import 'package:retrofit/retrofit.dart';

part 'http_client.g.dart';

@RestApi()
abstract class HttpClient {
  factory HttpClient(Dio dio, {String baseUrl}) = _HttpClient;

  @GET('/folders/{userId}')
  Future<List<Folder>> getFolders(@Path('userId') int userId);
}
