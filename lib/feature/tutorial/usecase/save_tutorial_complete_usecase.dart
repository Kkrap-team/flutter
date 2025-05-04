import 'package:krap/feature/tutorial/repository/tutorial_repository.dart';

class SaveTutorialCompleteUseCase {
  final TutorialRepository repository;

  SaveTutorialCompleteUseCase(this.repository);

  Future<void> call() async {
    await repository.setTutorialComplete(true);
  }
}
