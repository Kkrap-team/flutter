import 'package:dio/dio.dart';
import 'package:krap/common/http/dto/user_info.dart';
import 'package:krap/feature/login/dto/login_request.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api.g.dart';

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) = _LoginApi;

  @POST('/api/auth/kakao-login')
  Future<UserInfo> getUserInfo(@Body() LoginRequest loginRequest);
}
