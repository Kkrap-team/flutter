import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/core/util/app_logger.dart';
import 'package:krap/feature/main/dto/save_link_request.dart';
import 'package:krap/feature/main/tabs/home/provider/home_viewmodel_provider.dart';
import 'package:krap/feature/main/tabs/home/usecase/save_link_usecase.dart';

class HomeViewmodel extends AsyncNotifier<void> {
  late final SaveLinkUsecase _saveLinkUsecase;

  @override
  FutureOr<void> build() {
    final _repo = ref.read(homeRepositoryProvider);
    _saveLinkUsecase = SaveLinkUsecase(_repo);
  }

  Future<void> saveLink(int userId, SaveLinkRequest saveLinkRequest) async {
    try {
      state = const AsyncValue.loading();

      await _saveLinkUsecase.excute(userId, saveLinkRequest);

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      AppLogger.e('++createFolder() error = $error, stackTrace = $stackTrace');
    }
  }
}
