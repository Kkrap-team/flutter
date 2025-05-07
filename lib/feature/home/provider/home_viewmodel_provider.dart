import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/feature/home/viewmodel/home_viewmodel.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, int>((ref) {
  return HomeViewModel(initIndex: 0);
});
