import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/common/http/provider/dio_provider.dart';
import 'package:krap/common/http/repository/login/login_api.dart';
import 'package:krap/common/http/repository/login/login_repository.dart';
import 'package:krap/common/http/repository/login/login_repository_impl.dart';
import 'package:krap/feature/login/viewmodel/login_viewmodel.dart';

final loginApiProvider = Provider<LoginApi>((ref) {
  final dio = ref.watch(dioProvider);
  return LoginApi(dio);
});

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final loginApi = ref.watch(loginApiProvider);
  return LoginRepositoryImpl(loginApi);
});

final loginViewModelProvider = AsyncNotifierProvider<LoginViewModel, void>(
  LoginViewModel.new,
);
