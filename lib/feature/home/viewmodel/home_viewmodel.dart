import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<int> {
  HomeViewModel({required int initIndex}) : super(0) {
    state = initIndex;
  }

  void setPage(int index) {
    state = index;
  }
}
