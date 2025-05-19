import 'package:dio/dio.dart';
import 'package:krap/feature/main/dto/save_link_request.dart';
import 'package:krap/feature/main/dto/save_link_response.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api.g.dart';

@RestApi()
abstract class HomeApi {
  factory HomeApi(Dio dio) = _HomeApi;

  @POST('/links/{userId}')
  Future<SaveLinkResponse> saveLink(
    @Path('userId') int userId,
    @Body() SaveLinkRequest saveLinkRequest,
  );
}
