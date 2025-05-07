import 'package:krap/common/dto/user_info.dart';
import 'package:krap/feature/login/repository/login_repository.dart';

class SaveLoginedUserInfoUsecase {
  final LoginRepository repository;

  SaveLoginedUserInfoUsecase(this.repository);

  Future<UserInfo> call(String accessToken) async {
    return await repository.getUserInfo(accessToken);
  }
}
