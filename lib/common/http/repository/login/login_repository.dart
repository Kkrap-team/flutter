import 'package:krap/common/http/dto/user_info.dart';

abstract class LoginRepository {
  Future<UserInfo> getUserInfo(String accessToken);
}
