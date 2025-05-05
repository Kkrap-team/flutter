import 'package:krap/feature/tutorial/repository/tutorial_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialRepositoryImpl implements TutorialRepository {
  final SharedPreferences prefs;
  final String key = 'tutorial_done';

  TutorialRepositoryImpl(this.prefs);

  @override
  Future<void> setTutorialComplete(bool value) async {
    await prefs.setBool(key, value);
  }
}
