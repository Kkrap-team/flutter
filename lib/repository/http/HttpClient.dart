import 'package:dio/dio.dart';
import 'package:krap/dto/Folder.dart';
import 'package:retrofit/retrofit.dart';


part 'HttpClient.g.dart';

@RestApi(baseUrl: 'http://43.203.234.0:8080')
abstract class HttpClient {
  factory HttpClient(Dio dio, {String baseUrl}) = _HttpClient;

  @GET('/folders/{userId}')
  Future<List<Folder>> getUser(@Path('userId') int userId);
}
