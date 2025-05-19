import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/http/provider/dio_provider.dart';
import 'package:krap/feature/main/tabs/home/repository/home_api.dart';
import 'package:krap/feature/main/tabs/home/repository/home_repository.dart';
import 'package:krap/feature/main/tabs/home/repository/home_repository_impl.dart';
import 'package:krap/feature/main/tabs/home/usecase/save_link_usecase.dart';
import 'package:krap/feature/main/tabs/home/viewmodel/home_viewmodel.dart';

final homeApiProvider = Provider<HomeApi>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeApi(dio);
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final folderApi = ref.watch(homeApiProvider);
  return HomeRepositoryImpl(folderApi);
});

final homeViewModelProvider = AsyncNotifierProvider<HomeViewmodel, void>(
  HomeViewmodel.new,
);

final saveLinkUsecaseProvider = Provider<SaveLinkUsecase>((ref) {
  final repo = ref.watch(homeRepositoryProvider);
  return SaveLinkUsecase(repo);
});
