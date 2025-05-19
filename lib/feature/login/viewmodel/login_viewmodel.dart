import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/http/dto/user_info.dart';
import 'package:krap/common/http/provider/user_provider.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/login/usecase/login_with_kakao_usecase.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final LoginWithKakaoUsecase loginWithKakao;

  @override
  FutureOr<UserInfo?> build() {
    loginWithKakao = LoginWithKakaoUsecase();
    return null;
  }

  Future<void> login() async {
    try {
      state = const AsyncValue.loading();

      final accessToken = await loginWithKakao.loginWithKakao();
      AppLogger.d('++login() accessToken = $accessToken');

      await ref.read(userProvider.notifier).fetchUser(accessToken);

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      AppLogger.e('++login() error = $error, stackTrace = $stackTrace');
    }
  }

}
