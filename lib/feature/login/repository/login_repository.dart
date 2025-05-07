import 'package:krap/common/dto/user_info.dart';

abstract class LoginRepository {
  Future<UserInfo> getUserInfo(String accessToken);
}
