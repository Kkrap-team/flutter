import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/dto/user_info.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/login/provider/login_viewmodel_provider.dart';
import 'package:krap/feature/login/usecase/login_with_kakao_usecase.dart';
import 'package:krap/feature/login/usecase/save_login_info_usecase.dart';

class LoginViewModel extends AsyncNotifier<UserInfo?> {
  late final LoginWithKakaoUsecase loginWithKakao;
  late final SaveLoginedUserInfoUsecase saveLogin;

  @override
  FutureOr<UserInfo?> build() {
    final repo = ref.watch(loginRepositoryProvider);
    loginWithKakao = LoginWithKakaoUsecase();
    saveLogin = SaveLoginedUserInfoUsecase(repo);
    return null;
  }

  Future<void> getLoginWithKakao() async {
    try {
      state = const AsyncValue.loading();
      final token = await loginWithKakao.loginWithKakao();
      state = await AsyncValue.guard(() async => saveLoginedUserInfo(token));
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
      AppLogger.e('++getLoginWithKakao() error = $error');
    }
  }

  Future<UserInfo> saveLoginedUserInfo(String token) async {
    UserInfo userInfo = await saveLogin(token);
    return userInfo;
  }
}
