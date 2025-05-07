import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/feature/tutorial/usecase/save_tutorial_complete_usecase.dart';

class TutorialViewModel extends StateNotifier<int> {
  final SaveTutorialCompleteUseCase saveComplete;

  TutorialViewModel({required this.saveComplete}) : super(0);

  void prevPage() {
    if (state > 0) state--;
  }

  void nextPage() {
    if (state < 3) state++;
  }

  void setPage(int index) {
    state = index;
  }

  Future<void> completeTutorial() async {
    await saveComplete();
  }
}
