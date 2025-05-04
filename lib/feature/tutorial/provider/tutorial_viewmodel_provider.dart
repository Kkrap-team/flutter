import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krap/feature/tutorial/repository/tutorial_repository.dart';
import 'package:krap/feature/tutorial/repository/tutorial_repository_impl.dart';
import 'package:krap/feature/tutorial/usecase/save_tutorial_complete_usecase.dart';
import 'package:krap/feature/tutorial/viewmodel/tutorial_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(); // main()에서 override 해야 함
});

final tutorialCompleteRepositoryProvider = Provider<TutorialRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return TutorialRepositoryImpl(prefs);
});

final tutorialViewModelProvider = StateNotifierProvider<TutorialViewModel, int>(
  (ref) {
    final repo = ref.watch(tutorialCompleteRepositoryProvider);
    final useCase = SaveTutorialCompleteUseCase(repo);
    return TutorialViewModel(saveComplete: useCase);
  },
);
