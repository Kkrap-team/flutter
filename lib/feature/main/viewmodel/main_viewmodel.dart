import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewModel extends StateNotifier<int> {
  MainViewModel({required int initIndex}) : super(0) {
    state = initIndex;
  }

  void setPage(int index) {
    state = index;
  }
}
