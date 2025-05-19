import 'package:krap/common/http/dto/user_info.dart';
import 'package:krap/common/http/repository/login/login_api.dart';
import 'package:krap/common/http/repository/login/login_repository.dart';
import 'package:krap/feature/login/dto/login_request.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi api;

  LoginRepositoryImpl(this.api);

  @override
  Future<UserInfo> getUserInfo(String accessToken) {
    final request = LoginRequest(accessToken: accessToken);
    return api.getUserInfo(request);
  }
}
