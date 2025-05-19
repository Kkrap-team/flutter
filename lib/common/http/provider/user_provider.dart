import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/http/dto/user_info.dart';
import 'package:krap/common/http/repository/login/login_repository.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/login/provider/login_viewmodel_provider.dart';

final userProvider = AsyncNotifierProvider<_UserNotifier, UserInfo?>(
  _UserNotifier.new,
);

class _UserNotifier extends AsyncNotifier<UserInfo?> {
  late final LoginRepository _repo;

  @override
  FutureOr<UserInfo?> build() {
    _repo = ref.watch(loginRepositoryProvider);
    return null;
  }

  Future<void> fetchUser(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final user = await _repo.getUserInfo(accessToken);
      AppLogger.d('++fetchUser() user = ${user.toJson()}');
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
