import 'package:krap/common/dto/user_info.dart';
import 'package:krap/feature/login/dto/login_request.dart';
import 'package:krap/feature/login/repository/login_api.dart';
import 'package:krap/feature/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi api;

  LoginRepositoryImpl(this.api);

  @override
  Future<UserInfo> getUserInfo(String accessToken) {
    final request = LoginRequest(accessToken: accessToken);
    return api.getUserInfo(request);
  }
}
