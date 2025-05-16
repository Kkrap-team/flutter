import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/feature/main/viewmodel/main_viewmodel.dart';

final mainViewModelProvider = StateNotifierProvider<MainViewModel, int>((ref) {
  return MainViewModel(initIndex: 0);
});
